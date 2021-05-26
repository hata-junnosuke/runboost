class HomeController < ApplicationController
  before_action :authenticate_user!,{only:[:top]}
  
  def top
    @blogs = current_user.blogs
  end
end
