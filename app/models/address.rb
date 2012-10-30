class Address < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :address

	belongs_to :order
end