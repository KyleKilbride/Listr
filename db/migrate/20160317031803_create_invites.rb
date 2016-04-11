class CreateInvites < ActiveRecord::Migration
  def up
    create_table :invites do |t|
    	t.references :user
    	t.references :group
    	t.boolean "response", :default => false
    	t.timestamps null: false
    end
  end

  def down
  	drop_table :invites
  end
end
