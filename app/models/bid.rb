class Bid < ApplicationRecord
	belongs_to :project
	belongs_to :user
	has_many :installments, :dependent => :destroy
	accepts_nested_attributes_for :installments
end
