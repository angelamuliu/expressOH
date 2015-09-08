class RequestItem < ActiveRecord::Base
    
    # Relationships
    belongs_to :Request
    belongs_to :Item

    # Validations
    validates_presence_of :request_id, :item_id
end
