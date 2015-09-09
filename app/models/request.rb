class Request < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :shop
    has_many :request_items
    has_many :items, :through => :request_items

    # Validations
    validates_presence_of :shop_id

    # Scopes
    scope :chronological, order(:created_at)

    # Methods

    # Creates request_items so that items are associated to a request
    def addItemsToRequest(item_ids, request_id)
        for item_id in item_ids
            unless item_id.length < 1 # Rails checkboxes, if not checked, passes in ""
                request_item = RequestItem.new(item_id: item_id, request_id: request_id)
                if request_item.valid?
                    request_item.save
                end
            end
        end
    end

end
