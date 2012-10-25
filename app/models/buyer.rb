class Buyer < ActiveRecord::Base
	atrr_accesible :first_name
	has_many :orders
end