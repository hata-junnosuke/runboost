class AddUserIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    execute 'DELETE FROM blogs;'
    add_reference :blogs, :user, null: false
  end
end
