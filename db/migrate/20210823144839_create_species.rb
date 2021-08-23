class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :exposure
      t.integer :watering_frequency

      t.timestamps
    end
  end
end
