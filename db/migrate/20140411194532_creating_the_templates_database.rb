class CreatingTheTemplatesDatabase < ActiveRecord::Migration
  def change
    create_table :emailtemplates do |t|
      t.string :title,          null: false
      t.string :filename,        null: false
    end
  end
end
