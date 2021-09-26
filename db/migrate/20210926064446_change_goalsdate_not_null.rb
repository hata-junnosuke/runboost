class ChangeGoalsdateNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :goals, :date, false
  end
end
