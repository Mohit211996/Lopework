class StartupController < ApplicationController

	def frnds
		@request_connections = RequestConnection.where(:startup_id => current_user.id)
		@connection_new = Connection.new
	end

def project_details
	
	@project = Project.where(id: params[:project]).first

end
	def my_project
		@projects = Project.all
		# @startup_projects = StartupProject.all
		

	end

	def index
		technologies = []
		current_user.technologies.each do |technology|
			technologies << technology.id 

		end

    @projects = Project.where(project_status_id:1,technology_id:technologies)
	end

	def project_page
		@project = Project.where(id: params[:project]).first
		@installment = Installment.new
		@bid = Bid.new
		 @bid_exist = Bid.where("user_id=? AND project_id =?",current_user.id,@project.id)
		@startup = ClientPreference.where("user_id=? AND startup_status_id =?",current_user.id,4)
	if @bid_exist.count
@bid_installment = Installment.where(:bid_id => @bid_exist)
end

@project_accept_button = ClientPreference.where("user_id=? AND project_id =?",current_user.id,@project.id)

if @project_accept_button.count

@project_accept = @project_accept_button.where(:startup_status_id => 4)

end
end

def job_offer
	@startups = ClientPreference.where("user_id=? AND startup_status_id =?",current_user.id,4)
	@projects = Project.all;
	@bidded_projects = Bid.where(:user_id => current_user.id)
	@project_available=Project.where(:id => @bidded_projects.select(:project_id),:project_status_id => 1)
	@project_under_bidding = Project.where(:id => @bidded_projects.select(:project_id),:project_status_id => 2)
	@project_under_bidding_ids = @project_under_bidding.select(:project_id)
	@project_in_client_preferences = ClientPreference.where(:project_id => @project_under_bidding_ids,:user_id => current_user.id).select(:project_id)
	@project_to_show = @project_under_bidding.where(:id => @project_in_client_preferences)	
end


def request_method
		@client_preference = ClientPreference.where(project_id: params[:project_id], user_id: current_user.id).first 
		if params[:decide]== 'accept'			
			# @array = ClientPreference.where(project_id: params[:project_id], startup_status_id: 1)
			# @array.each do |a|
			# 	a.update_attribute(:startup_status_id,3)
			# end
			@client_preference.update_attribute(:startup_status_id,1)
			@startup_project = StartupProject.new(:project_id => params[:project_id], :user_id => current_user.id)
			@startup_project.save
			@project_updated = Project.find(params[:project_id])
			@project_updated.update(:project_status_id => 3)
		else
			@client_preference.update_attribute(:startup_status_id,2)
			@temp = @client_preference.id + 1
			if ClientPreference.find(@temp).project_id == params[:project_id]
				@client_preference = ClientPreference.find(@temp)
				@client_preference.update_attribute(:startup_status_id,4)
			else
				# dubara project post karna hai

			end	
		end
		
		respond_to do |format|
	        format.html { redirect_to :controller => 'startup', :action => 'job_offer'}
    	end
	end

 def startup_params
      params.permit(:decide, :project_id,:project_status_id)
  end



end
