class Technology < ApplicationRecord
	has_many :startup_technologies
	has_many :users, through: :startup_technologies
	
end
