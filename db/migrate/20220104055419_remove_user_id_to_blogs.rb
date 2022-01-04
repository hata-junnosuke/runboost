class RemoveUserIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :blogs, :user
  end
end
