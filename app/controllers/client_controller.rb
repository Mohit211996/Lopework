class ClientController < ApplicationController

	def index
		
		 @projects = Project.where(user_id: current_user.id).all
		 
	end
# 	def client_params
#       # params.fetch(:project, {},:id,:body)
#        params.require(:client).permit(:id,:technology_id,:user_id,:project_status_id, :name, :budget, :time, :requirement
# )
#     end
end
