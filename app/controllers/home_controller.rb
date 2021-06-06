class HomeController < ApplicationController
  before_action :authenticate_user!,{only:[:top]}
  
  def top
    @blogs = current_user.blogs
    @users = current_user
    @goal = current_user.goals.this_month.last
  end
end
