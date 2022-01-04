class AddUserIdToGoals < ActiveRecord::Migration[5.2]
  def change
    execute 'DELETE FROM goals;'
    add_reference :goals, :user, null: false, index: true
  end
end
