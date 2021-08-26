class AddArrayDateToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :waterings_date, :date, array: true
  end
end
