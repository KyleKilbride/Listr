# Class: User - extends ActiveRecord
# Description: Has many lists
# 			   Belongs to many users
#       	   Has many users
class Group < ActiveRecord::Base
	has_many :lists
	has_and_belongs_to_many :users
end
