class Language < ActiveRecord::Base
	has_many :categories
	belongs_to :status
	validates_presence_of :title, :status_id


end
