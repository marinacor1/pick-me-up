class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :initial_location
      t.string :destination
      t.date :date
      t.string :time

      t.timestamps null: false
    end
  end
end
