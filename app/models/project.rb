class Project < ApplicationRecord
	belongs_to :technology
	belongs_to :user
	belongs_to :project_status

end