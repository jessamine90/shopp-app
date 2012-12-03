class Order < ActiveRecord::Base
	attr_accessible :buyer_id, :completed
	belongs_to :buyer
	has_many :order_items
end