class User < ActiveRecord::Base
	has_secure_password
	
	has_many :requests
	has_many :deliveries

	validates_presence_of :username, :email
	validates :username, uniqueness: true	

	def ranking
		rank = 0
		if self.times_ranked == 0
			rank = 0
		else
			rank = self.total_rating / self.times_ranked.to_f
		end
		return rank
	end


end
