class HomesController < ApplicationController
	def index
		@startup_count=User.where(role_id: '1').count
		@client_count=User.where(role_id: '2').count
		@all = User.all.count
	end
	def font_page
		
	end
end
