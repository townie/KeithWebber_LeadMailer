class AddingTemplateToEmail < ActiveRecord::Migration
  def change
    add_column :materials, :email_templates_id, :integer
  end
end
