class ClientController < ApplicationController

	def index
		
		 @projects = Project.where(user_id: current_user.id).all
		 
	end

	def all_bidding_page
	end
	def project_display_page
	end
	def project_display_page_2
		@client_preference = ClientPreference.new
		@project_id =2
	end
end
