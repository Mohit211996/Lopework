class StartupController < ApplicationController
	def index

		@projects = Project.all



	end
	def project_status
		@project_status = Project_status.find(params[:id])
	end
	def project_detail
		@projects = Project.all


	end
	
end