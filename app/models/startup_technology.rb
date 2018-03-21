class StartupTechnology < ApplicationRecord
	belongs_to :user
	belongs_to :technology

	# @start = StartupTechnology.new

end
