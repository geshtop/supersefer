class Shipping < ActiveRecord::Base
	has_many :shippingoptions
	belongs_to :status
	validates_presence_of :title, :status_id
end
