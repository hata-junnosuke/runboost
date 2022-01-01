class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, { only: %i[edit update destroy] }
  before_action :ensure_normal_user, only: %i[update destroy]

  def index
    @users = User.page(params[:page]).per(12)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = current_user.new(user_params)
    if @user.save
      redirect_to root_url, notice: '記録しました。'
    else
      flash[:alert] = '登録できませんでした。'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_url(@user), notice: '編集しました。'
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy!
    redirect_to root_url, notice: '削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile, :profie_image_id)
  end

  def ensure_normal_user
    redirect_to root_url, alert: 'ゲストユーザーは編集・削除できません。' if current_user.email == 'guest@guest.com'
  end

  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    if params[:id].to_i != current_user.id
      flash[:alert] = '権限がありません'
      redirect_to root_url
    end
  end
end
