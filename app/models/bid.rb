class Bid < ApplicationRecord
	 has_many :installments
	belongs_to :project, uniqueness: true
	belongs_to :user, uniqueness: true
	 accepts_nested_attributes_for :installments, allow_destroy: true
	
end
