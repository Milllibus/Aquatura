class AddDefaultLevelValueToEplants < ActiveRecord::Migration[6.0]
  def change
    change_column :eplants, :level, :integer, default: 0
  end
end
