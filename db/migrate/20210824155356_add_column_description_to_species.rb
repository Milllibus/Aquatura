class AddColumnDescriptionToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :description, :text
  end
end
