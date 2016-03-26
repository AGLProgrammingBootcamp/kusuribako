class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :effect
      t.string :frequency

      t.timestamps null: false
    end
  end
end
