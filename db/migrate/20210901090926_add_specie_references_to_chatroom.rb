class AddSpecieReferencesToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :specie, null: false, foreign_key: true
  end
end
