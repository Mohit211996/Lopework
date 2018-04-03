class StartupController < ApplicationController

	def index
		@projects = Project.where(project_status_id: 1);
	end

	def project_page
		@project = Project.where(id: params[:project]).first
		@installment = Installment.new
		@bid = Bid.new
	end

def job_offer
	@startups = ClientPreference.where("user_id=? AND startup_status_id =?",current_user.id,4)

	@projects = Project.all;
end

	def request_method
		@client_preference = ClientPreference.where(project_id: params[:project_id], user_id: current_user.id).first 
		if params[:decide]== 'accept'			
			byebug
		else
			@client_preference.update_attribute(:startup_status_id,2)
			@temp = @client_preference.id + 1
			if ClientPreference.find(@temp).project_id == params[:project_id]
				@client_preference = ClientPreference.find(@temp)
				@client_preference.update_attribute(:startup_status_id,4)
			else
				# dubara project post karana hai
			end	
		end
		
		respond_to do |format|
	        format.html { redirect_to :controller => 'startup', :action => 'job_offer'}
    	end
	end

 def startup_params
      params.permit(:decide, :project_id)
    end



end
