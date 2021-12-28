class ChangeBlogsLimit < ActiveRecord::Migration[5.2]
  def up
    change_column :blogs, :content, :text, limit: 15
    change_column :blogs, :comment, :text, limit: 255
  end

  def down
    change_column :blogs, :content, :text
    change_column :blogs, :comment, :text
  end
end
