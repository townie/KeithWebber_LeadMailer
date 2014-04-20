class CreatingTheTemplatesDatabase < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.string :title,            null: false
      t.string :filename,         null: false
    end
  end
end
