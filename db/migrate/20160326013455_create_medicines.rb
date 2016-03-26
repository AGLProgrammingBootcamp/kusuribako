class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :effect

      t.timestamps null: false
    end
  end
end
