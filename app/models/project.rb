class Project < ApplicationRecord
	belongs_to :technology
	belongs_to :user
	belongs_to :project_status
	has_many :bids
	has_one :startup_project
	has_many :client_preferences
	
# validates_uniqueness_of :bids, :scope => [:user_id]
end
