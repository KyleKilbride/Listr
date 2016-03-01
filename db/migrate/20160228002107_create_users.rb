# 
# Migration: create users
# Description: creates the user database table
#
class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50	
      t.string "email", :default => "", :null => false
      t.string "password", :default => "", :limit => 50, :null => false
      t.timestamps null: false
    end
  end

  def down
  	drop_table :users 
  end
end
