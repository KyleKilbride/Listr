class AddDescriptionColumnToGroups < ActiveRecord::Migration
  
  def up
  	add_column 'groups', 'description', :string
  end

  def down
  	remove_column 'groups', 'description'
  end

end
