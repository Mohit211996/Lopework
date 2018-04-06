class Bid < ApplicationRecord
	 has_many :installments
	 belongs_to :project, optional: true
   belongs_to :user
   # belongs_to :client_preference, through: :project

	
validates_uniqueness_of :user_id, :scope => [:project_id]
accepts_nested_attributes_for :installments, allow_destroy: true
	
end
