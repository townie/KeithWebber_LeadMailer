class CreatingContactsCampaignsUnion < ActiveRecord::Migration
  def change
    create_table :contact_campaigns do |t|
      t.integer :contact_id,           index: true,   null: false
      t.integer :campaign_id,          index: true,   null: false
    end
  end
end
