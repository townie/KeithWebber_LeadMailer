class CreatingACampaign < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string  :title,          null: false
      t.text    :purpose,        null: false
      t.integer :user_id,        null: false
    end
    add_index :campaigns, :user_id
  end
end
