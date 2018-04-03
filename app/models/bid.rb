class Bid < ApplicationRecord
	 has_many :installments
	belongs_to :project
	belongs_to :user
	 accepts_nested_attributes_for :installments, allow_destroy: true
	
end
