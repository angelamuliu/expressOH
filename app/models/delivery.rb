class Delivery < ActiveRecord::Base
	belongs_to :user
	belongs_to :request

	scope :choronological, -> { order("created_at") }

    # Validations
    validates :request, uniqueness: true

    # Methods

    # Returns the amount of money earned via tip assuming a $1 per item wage
    def get_profits()
        return Request.format_cost(request.items.size)
    end

end
