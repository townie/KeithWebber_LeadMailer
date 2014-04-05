class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,        null: false, uniqueness: true
      t.string :phone_number
    end
  end
end
