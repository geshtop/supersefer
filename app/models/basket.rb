class Basket < ActiveRecord::Base
	belongs_to :book
	validates_presence_of :book_id, :session_id, :quantity

	

	
end
