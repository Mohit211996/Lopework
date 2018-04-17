class Bid < ApplicationRecord
	 has_many :installments
	 belongs_to :project, optional: true
   belongs_to :user
   # belongs_to :client_preference, through: :project
accepts_nested_attributes_for :installments, allow_destroy: true, reject_if: :all_blank
validate :check_bidding_time
validate :check_bidding_budget
validates_uniqueness_of :user_id, :scope => [:project_id]


private 
	
	def check_bidding_time
		project = Project.find(self.project_id)
		unless installments.map(&:time).sum <= project.time

			errors.add(:time," can not exceed the alloted time")
		end
		
	end
	def check_bidding_budget
		project = Project.find(self.project_id)
		unless installments.map(&:budget).sum <= project.budget

			errors.add(:budget," can not exceed the alloted budget")

			
		end
		
	end




	
end
