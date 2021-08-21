# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = current_user.goals.all
  end

  def new
    @goal = current_user.goals.new
  end

  def show
    @goal = current_user.goals.find(params[:id])
  end

  def create
    current_user.goals.build(goal_params).save
    redirect_to root_path, notice: '設定しました。'
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
    redirect_to goals_path, notice: '削除しました。'
  end

  def edit
    @goal = current_user.goals.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goals_path, notice: '編集しました。'
    else
      render 'edit'
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:distance, :date)
  end
end
