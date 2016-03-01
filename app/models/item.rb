# Class: Item - extends ActiveRecord
# Description: Belongs to a list
class Item < ActiveRecord::Base
	belongs_to :list
end
