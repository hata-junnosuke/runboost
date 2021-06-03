class HomeController < ApplicationController
  before_action :authenticate_user!,{only:[:top]}
  
  def top
    @blogs = current_user.blogs
    @users = current_user
    @goals = current_user.goals
  end
end
