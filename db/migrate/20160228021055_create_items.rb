# 
# Migration: create items
# Description: creates the items database table
#
class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.references :list
      t.string "name", :limit => 50
      t.string "link"
      t.text "note"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :items
  end
end
