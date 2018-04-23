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
		if @project.project_status.id == 3
			
			@startupid=StartupProject.where(:project_id => params[:project_id]).first.user_id
			@startup = User.find(@startupid)
			@install = @startup.bids.where(:project_id => params[:project_id]).first.installments
			@techno = Project.find(params[:project_id]).technology
			
		end

		@connections = Connection.where(:user_id => current_user.id)
		@requested_connections = RequestConnection.where(:user_id => current_user.id )
		@request_connection_new = RequestConnection.new
		@connection_new = Connection.new



	end
	def project_display_page_2
		@client_preference = ClientPreference.new
		@project_id =2
	end

	def connections_client
		@connections = Connection.where(:user_id => current_user.id)
		@users = User.where(:id => @connections.select(:startup_id))
		@all_ids = Project.where(:user_id => current_user.id).select(:id)
		@connection_new = Connection.new
		
	end

	def history_page
		@array = Array.new
		@my_array = Array.new
		@my_count = Array.new
		@completed_projects = Project.where(:user_id => current_user.id,:project_status_id => 4)
		@projects = Project.where(:user_id => current_user.id)
		@array << @projects.where(:project_status_id  => 1).count
		@array << @projects.where(:project_status_id  => 2).count
		@array << @projects.where(:project_status_id  => 3).count
		@array << @projects.where(:project_status_id  => 4).count
		count = 0
		date = current_user.created_at.to_date.beginning_of_month
		stop = Date.today
		@project_all = Project.where(:user_id => current_user.id)
		@project_all = @project_all.where("project_status_id = ? OR project_status_id = ?",3,4)
		@sum = 0 
		while (date <= stop)
			@project_all.where("created_at <= ?",date).each do|project|
				user_id = StartupProject.where(:project_id => project.id).first.user_id
				@bid = Bid.where(:project_id => project.id,:user_id => user_id)
				@sum = @bid.first.installments.map(&:budget).sum + @sum
			end
			@my_array << @sum
			@sum = 0
			count = count + 1
			@my_count << count
		  date = date+6.days
		end
	end

end
