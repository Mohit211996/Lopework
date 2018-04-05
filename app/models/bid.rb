class Bid < ApplicationRecord
	 has_many :installments
	 belongs_to :project, optional: true
   belongs_to :user

	 # validates :user_id, uniqueness: true
	 # validates :project_id, uniqueness: true
validates_uniqueness_of :id, :scope => [:project_id, :user_id]
	  # validates_uniqueness_of :user_id, :scope => [:id,:project_id]
accepts_nested_attributes_for :installments, allow_destroy: true
	
end
