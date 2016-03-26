class CreateFrequenciesMedicines < ActiveRecord::Migration
  def change
    create_table :frequencies_medicines do |t|
      t.references :frequency, index: true, foreign_key: true
      t.references :medicine, index: true, foreign_key: true
    end
  end
end
