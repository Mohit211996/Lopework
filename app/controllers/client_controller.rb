class ClientController < ApplicationController

	def index
		@projects = Project.where(:user_id => current_user.id)
		@project= Project.where(:user_id => current_user.id,:project_status => 1)
		@projects_alloted = Project.where(:user_id => current_user.id,:project_status => 3)
		

	end

	def all_bidding_page
	end
	def project_display_page
		@project=Project.find(params[:project_id])
		@client_preference = ClientPreference.new
		@startup
		if @project.project_status == 3
			@startup_id=StartupProject.where(:project_id => params[:project_id]).first.startup_id
			@startup = User.find(@startup_id)
		end

	end
	def project_display_page_2
		@client_preference = ClientPreference.new
		@project_id =2
	end
end
