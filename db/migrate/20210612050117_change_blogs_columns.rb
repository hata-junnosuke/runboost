class ChangeBlogsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :comment, :text
    remove_column :blogs, :title, :string
  end
end
