class AddingEmailtemplateToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :email_template_id, :integer, index: true
  end
end
