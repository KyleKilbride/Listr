class UsersToGroups < ActiveRecord::Migration
  def up
  	create_table :users_to_groups do |t|
  		t.references :user
  		t.references :group
  	end
  end

  def down
  	drop_table :users_to_groups
  end
end
