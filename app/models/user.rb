class User < ActiveRecord::Base
	belongs_to :user
	belongs_to :request

	scope :choronological, -> { order("created_at") }

end
