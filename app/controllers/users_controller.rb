# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, { only: %i[edit update destroy] }

  def index
    @users = User.page(params[:page]).per(12)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to root_path, notice: '削除しました。'
  end

  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    if params[:id].to_i != current_user.id
      flash[:alert] = '権限がありません'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile, :profie_image_id)
  end
end
