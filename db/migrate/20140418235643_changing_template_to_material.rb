class ChangingTemplateToMaterial < ActiveRecord::Migration
  def up
    remove_column :campaigns, :email_template_id
    add_column :materials, :email_template_id, :integer, index: true
  end

  def down
    add_column :campaigns, :email_template_id, :integer
    remove_column :materials, :email_template_id
  end
end
