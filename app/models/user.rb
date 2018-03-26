class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
has_one :approval
has_one :role
has_many :startup_technologies, :dependent => :destroy
has_many :technologies, through: :startup_technologies
has_many :projects
# accepts_nested_attributes_for :technologies

 
after_create do 

	UserMailer.sign_up(User.last).deliver


	# if User.last.role_id == 1
	# 	redirect_to startup_path
	# else


  end



end
