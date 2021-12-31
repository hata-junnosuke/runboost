class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = current_user.goals
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    if current_user.goals.build(goal_params).save
      redirect_to root_url, notice: '設定しました。'
    else
      flash[:alert] = '登録できませんでした。'
      render 'index'
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:distance, :date)
  end
end
