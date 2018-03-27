class StartupController < ApplicationController

	def index
		@projects = Project.where(project_status_id: 1);
	end

	def project_page
		@project = Project.where(id: params[:project]).first
		
	end



end
