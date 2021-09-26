class ChangeGoalsUserIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :goals, :user_id, false
  end
end
