# Class: List - extends ActiveRecord
# Description: Belongs to user
#       	   Belongs to group
class List < ActiveRecord::Base
	has_many :items
	belongs_to :user
	belongs_to :group
end
