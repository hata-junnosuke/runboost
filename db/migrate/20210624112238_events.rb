# frozen_string_literal: true

class Events < ActiveRecord::Migration[5.2]
  def change
    drop_table :events
  end
end
