class MakingTheFieldsBigger < ActiveRecord::Migration

  def up
    drop_table :materials

      create_table :materials do |t|
        t.integer :campaign_id, null: false
        t.string :title,        null: false
        t.text :field1
        t.text :field2
        t.text :field3
        t.text :field4
        t.text :field5
        t.text :field6
        t.text :field7
        t.text :field8
        t.text :field9
        t.text :field10

        t.timestamps
    end
  end

  def down
    drop_table :materials

      create_table :materials do |t|
        t.integer :campaign_id, null: false
        t.string :title,        null: false
        t.string :field1
        t.string :field2
        t.string :field3
        t.string :field4
        t.string :field5
        t.string :field6
        t.string :field7
        t.string :field8
        t.string :field9
        t.string :field10

        t.timestamps
      end
  end
end
