# frozen_string_literal: true

class AddGoalToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :goal, :integer
  end
end
