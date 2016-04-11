# Class: User - extends ActiveRecord
# Description: holds the secure password gem
# 			   Has many lists
#       	   Belongs to many groups
class User < ActiveRecord::Base

	has_secure_password

	has_many :lists
	has_many :invites
	has_and_belongs_to_many :groups
end
	