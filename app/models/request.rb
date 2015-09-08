class Request < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :shop
    has_many :items, :through => :request_items

    # Validations
    validates_presence_of :shop_id

    # Scopes
    scope :chronological, order(:created_at)

end
