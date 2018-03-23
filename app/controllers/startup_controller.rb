class StartupController < ApplicationController
	def index
		@projects = Project.all
	end
	def project_status
		@project_status = Project_status.find(params[:id])
	end
	
end
