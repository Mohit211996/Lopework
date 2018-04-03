class ClientPreference < ApplicationRecord
	belongs_to :project
	belongs_to :user
	belongs_to :startup_status
end
