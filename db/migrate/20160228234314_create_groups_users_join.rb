# 
# Migration: create group users join
# Description: creates the group users join table
#
class CreateGroupsUsersJoin < ActiveRecord::Migration
  def up
    create_table :groups_users, :id => false do |t|
    	t.integer "group_id"
    	t.integer "user_id"
    end
    add_index :groups_users, ["group_id", "user_id"]
  end

  def down
  	drop_table :groups_users
  end
end
