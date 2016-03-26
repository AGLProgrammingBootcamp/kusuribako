class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.date :day
      t.boolean :opend

      t.timestamps null: false
    end
  end
end
