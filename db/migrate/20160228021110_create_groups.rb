class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.string "name", :null => false, :default => "Group Title", :limit => 50
      t.integer "number_of_members"
      t.integer "owner_id"
      t.string "type_of_group", :null => false, :default => "regular"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :groups
  end
end
