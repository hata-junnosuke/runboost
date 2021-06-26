class UsersController < ApplicationController
   before_action :authenticate_user!
   
  def index
    @users = User.all
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
    redirect_to root_path, notice:"削除しました。"
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profie_image)
  end
  
end
