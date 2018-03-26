class ClientController < ApplicationController
	def index
		
		 # @project = Project.find(params[:id])
		 # @technology = Technology.find(params[:id])
	end
	def client_params
      # params.fetch(:project, {},:id,:body)
       params.require(:client).permit(:id,:technology_id,:user_id,:project_status_id, :name, :budget, :time, :requirement
)
    end
end
