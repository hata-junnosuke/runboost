class ChangeDistanceOfGoals < ActiveRecord::Migration[5.2]
  def up
    change_column :goals, :distance, :integer, default: '未入力'
  end
  
  def down
    change_column :goals, :distance, :integer
  end
end
