# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  def index
    @blogs = current_user.blogs
    @blogs_for_pagenation = current_user.blogs.page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.new(blog_parameter)
    if @blog.save
      redirect_to blogs_path, notice: '記録しました。'
    else
      flash[:alert] = 'メニュー又は距離を入力してください。'
      render 'new'
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: '削除しました。'
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: '編集しました。'
    else
      render 'edit'
    end
  end

  def ensure_correct_user
    @blog = Blog.find_by(id: params[:id])
    if @blog.user_id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :distance, :start_time, :comment)
  end
end
