# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, { only: [:top] }

  def top
    @blogs = current_user.blogs
    @users = current_user
    @goal = current_user.goals
  end

  def about
  end
end
