class AddDateToWaterings < ActiveRecord::Migration[6.0]
  def change
    add_column :waterings, :water_date, :date
  end
end
