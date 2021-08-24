class ChangeWateringFrequencyToFloatinSpecies < ActiveRecord::Migration[6.0]
  def change
    change_column :species, :watering_frequency, :float
  end
end
