class CreateEplants < ActiveRecord::Migration[6.0]
  def change
    create_table :eplants do |t|
      t.integer :level
      t.string :nickname
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
