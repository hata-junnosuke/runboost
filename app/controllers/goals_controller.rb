class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def create
    Goal.create(goal_params)
    redirect_to goals_path
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_path, notice:"削除しました"
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goals_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:distance, :date)
  end
end
