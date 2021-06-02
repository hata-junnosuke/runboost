class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :user_id
      t.integer :distance
      t.datetime :date
      t.timestamps
    end
  end
end
