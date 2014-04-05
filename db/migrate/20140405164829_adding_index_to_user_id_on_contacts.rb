class AddingIndexToUserIdOnContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :user_id, :integer, null: false
    add_index :contacts, :user_id
    add_index :contacts, :email
  end
end
