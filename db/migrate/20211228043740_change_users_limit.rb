class ChangeUsersLimit < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :username, :string, limit: 30
    change_column :users, :profile, :text, limit: 150
  end

  def down
    change_column :users, :username, :string
    change_column :users, :profile, :text
  end
end
