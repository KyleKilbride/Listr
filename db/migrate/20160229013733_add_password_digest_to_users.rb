# 
# Migration: Add password digest to users
# Description: adds the password digest field to the users table
#
class AddPasswordDigestToUsers < ActiveRecord::Migration
  def up
  	add_column "users", "password_digest", :string 
  end

  def down
  	remove_column "users", "password_digest"
  end
end
