class User < ActiveRecord::Base
	has_secure_password
	
	has_many :requests
	has_many :deliveries

	validates_presence_of :username, :email
	validates :username, uniqueness: true	


end
