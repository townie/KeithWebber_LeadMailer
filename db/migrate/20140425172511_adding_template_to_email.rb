class AddingTemplateToEmail < ActiveRecord::Migration
  def change
    add_column :materials, :email_template_id, :integer
  end
end
