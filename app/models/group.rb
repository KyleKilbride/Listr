class Group < ActiveRecord::Base
	has_many :lists
	has_and_belongs_to_many :users
end
