class ChangeBlogscontentNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :blogs, :content, false
    change_column_null :blogs, :start_time, false
  end
end
