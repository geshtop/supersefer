class Shippingoption < ActiveRecord::Base

	belongs_to :status
	belongs_to :shipping

	validates_presence_of :title, :status_id, :price, :from_weight, :to_weight
end
