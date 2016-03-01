# 
# Migration: create list
# Description: creates the list database table
#
class CreateLists < ActiveRecord::Migration
  def up
    create_table :lists do |t|
      t.references :user
      t.references :group
      t.string "name", :default => "", :limit => 40
      t.timestamps null: false
    end
  end

  def down
  	drop_table :lists 
  end
end
