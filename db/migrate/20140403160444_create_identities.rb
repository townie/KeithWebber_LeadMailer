class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user,       index: true,   null: false
      t.string :provider,                      null: false
      t.string :uid,            index: true,   null: false
      t.string :oauth_token,                   null: false
      t.string :oauth_secret,                  null: false
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
