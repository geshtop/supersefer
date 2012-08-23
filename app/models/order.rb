class Order < ActiveRecord::Base
	has_many :orderitems
	belongs_to :status
	belongs_to :user
	accepts_nested_attributes_for :orderitems
	validates_presence_of :user_id 

end
