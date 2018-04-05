class ClientController < ApplicationController

	def index
		@projects= Project.where(:user_id => current_user.id)
		@array = Array.new
		@bid_count =Array.new
		@projects.each do |p|
			count = p.client_preferences.where(:startup_status_id => 1).count
			if count != 1
				@array<< p.id
				@bid_count << Bid.where(:project_id => p.id).count
			end
		end
		@project=Project.where(:id => @array)
	end

	def all_bidding_page
	end
	def project_display_page
		@client_preference = ClientPreference.new
		@project_id =2
		@post_again = 0
		@show_installments = 0
		@project=Project.find(params[:project_id])
		project_preferences = ClientPreference.where(:project_id => params[:project_id])
		@accepted = project_preferences.where(:startup_status_id => 1).count
		@total = project_preferences.count
		rejected = project_preferences.where(:startup_status_id => 2).count
		if @total = 0
			@all_users = Bid.where(:project_id => params[:project_id])
		elsif @total == rejected
			@post_again = 1
		end
	end
	def project_display_page_2
		@client_preference = ClientPreference.new
		@project_id =2
	end
end
