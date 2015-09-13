class Request < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :shop
    has_many :request_items
    has_many :items, :through => :request_items 
    has_one :delivery
    
    # Validations
    validates_presence_of :shop_id

    # Scopes
    scope :chronological, order(:created_at)
    scope :requested_within_the_hr, ->(hr_span) { where("created_at > ?", Time.now-hr_span) }
    scope :for_shop, -> (shop_id) { where("shop_id = ?", shop_id)}

    # Unclaimed scope requires joining on the deliveries table
    # SOURCE: http://stackoverflow.com/questions/5332093/finding-records-with-no-associated-records-in-rails-3
    scope :unclaimed, -> {joins("left outer join deliveries on deliveries.request_id = requests.id").where("deliveries.id is null")}


    # Methods

    # Returns in minutes how long ago this request was created as a nice string
    def minute_age()
        return ((Time.now - created_at) % 60).round().to_s + " minutes ago"
    end

    # Returns the total cost of items ordered in this request
    def total_cost()
        total_cost = 0
        for item in items
            total_cost += item.price
        end
        return total_cost
    end

    # Returns the total cost of items including a $1 tip per item
    def tipped_total_cost()
        tipped_total_cost = 0
        for item in items
            tipped_total_cost += item.price
            tipped_total_cost += 1
        end
        return tipped_total_cost
    end

    # Takes in a float and formats to be in currency format
    def format_cost(cost)
        return "$%.2f" % cost
    end

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
