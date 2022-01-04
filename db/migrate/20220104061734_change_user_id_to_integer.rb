class ChangeUserIdToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :user_id, :integer, null: false, index: true
    change_column :goals, :user_id, :integer, null: false, index: true
  end
end
