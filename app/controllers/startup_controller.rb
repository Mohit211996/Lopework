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
	@client = ClientPreference.where("user_id = ? AND startup_status_id = ?", current_user.id,4)
end

end
