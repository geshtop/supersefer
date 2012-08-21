class Order < ActiveRecord::Base
	has_many :orderitems
	belongs_to :status
	accepts_nested_attributes_for :orderitems
end
