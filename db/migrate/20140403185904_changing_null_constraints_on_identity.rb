class ChangingNullConstraintsOnIdentity < ActiveRecord::Migration
  def up
    remove_column :identities, :provider
    remove_column :identities, :oauth_token
    remove_column :identities, :oauth_secret

    add_column :identities, :provider,     :string
    add_column :identities, :oauth_token,  :string
    add_column :identities, :oauth_secret, :string
  end

  def down
    change_column :identities, :provider,     :string,  null: false
    change_column :identities, :oauth_token,  :string,  null: false
    change_column :identities, :oauth_secret, :string,  null: false
  end
end
