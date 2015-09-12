class Item < ActiveRecord::Base

  #Callbacks

  #Relationships
  has_many :request_items
  has_many :items, through: :request_items
  belongs_to :shop

  #Validations
  validates :name, presence: true, uniqueness: true #case-sensitive e.g. allows yale and Yale
  validates :price, presence: true
  validates :shop_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # #Scopes
  scope :alphabetical, -> { order('name') }

  #Methods

end
