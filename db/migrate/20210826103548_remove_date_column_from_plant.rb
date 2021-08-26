class RemoveDateColumnFromPlant < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :waterings_date
  end
end
