class Shop < ActiveRecord::Base

  #Callbacks

  #Relationships
  has_many :items
  has_many :requests

  #Validations
  validates :name, presence: true, uniqueness: true #case-sensitive e.g. allows yale and Yale
  validates :address, presence: true, uniqueness: true
  validates_time :open_time, :close_time

  # #Scopes
  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :open, -> {where("open_time < ? AND close_time > ?", Time.now, Time.now)}
  scope :closed, -> {where("open_time > ? OR close_time < ?", Time.now, Time.now)}

  #Methods

end