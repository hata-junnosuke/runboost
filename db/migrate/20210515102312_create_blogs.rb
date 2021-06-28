# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :distance
      t.datetime :start_time

      t.timestamps
    end
  end
end
