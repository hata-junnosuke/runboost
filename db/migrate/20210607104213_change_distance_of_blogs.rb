class ChangeDistanceOfBlogs < ActiveRecord::Migration[5.2]
  def up
    change_column :blogs, :distance, :integer, default: 0
  end
  
  def down
    change_column :blogs, :distance, :integer
  end
end
