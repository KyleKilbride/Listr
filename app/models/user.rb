class User < ActiveRecord::Base

	has_secure_password

	has_many :lists
	has_and_belongs_to_many :groups
end
	