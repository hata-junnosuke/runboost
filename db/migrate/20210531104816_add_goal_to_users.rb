# frozen_string_literal: true

class AddGoalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :goal, :integer
  end
end
