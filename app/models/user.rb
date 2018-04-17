class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create { generate_token(:auth_token)}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
has_one :approval
has_one :role
has_many :startup_technologies, :dependent => :destroy
has_many :technologies, through: :startup_technologies
has_many :projects
has_many :bids
has_many :startup_projects
has_one :client_preference
has_many :connections
has_many :request_connections
# validates_uniqueness_of :user_id, :scope => [:project_id, :bid_id]

# accepts_nested_attributes_for :technologies

 
after_create do 

	UserMailer.sign_up(User.last).deliver


	# if User.last.role_id == 1
	# 	redirect_to startup_path
	# else


  end
    def generate_token(column)
	begin
	    	
	    self[column] = SecureRandom.urlsafe_base64
	end while User.exists?(column => self[column])
	    	
	    end    
  



end
