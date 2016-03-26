class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :morning
      t.boolean :afternoon
      t.boolean :evening

      t.timestamps null: false
    end
  end
end
