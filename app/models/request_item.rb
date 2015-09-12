class RequestItem < ActiveRecord::Base
    
    # Relationships
    belongs_to :request
    belongs_to :item

    # Validations
    validates_presence_of :request_id, :item_id
end
