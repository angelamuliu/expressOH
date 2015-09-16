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

  # These scopes are having issues with comparing time for some reason (I think it's due to Time.now returning date as well,
  # which is messing with proper time comparison. For now they are going to be class methods)
  # scope :open, -> {where("open_time <= ? AND close_time >= ?", Time.now, Time.now)}
  # scope :closed, -> {where("open_time > ? OR close_time < ?", Time.now, Time.now)}

  #Methods

  # Prettily returns the open to close hours as a string
  def get_hours
    return open_time.strftime("%l:%M%P") + " - " + close_time.strftime("%l:%M%P")
  end

  def isOpen
    if open_time.hour <= Time.now.hour && close_time.hour >= Time.now.hour
        # Check minute hand for edge cases
        if open_time.hour == Time.now.hour
            return open_time.min >= Time.now.min
        elsif close_time.hour == Time.now.hour
            return close_time.min >= Time.now.min
        else
            return true
        end
    end
    return false
  end

    def self.open(allShops)
        openShops = []
        allShops.each do |shop|
            if (shop.isOpen())
                openShops.append(shop)
            end
        end
        return openShops
    end

    def self.closed(allShops)
        closedShops = []
        allShops.each do |shop|
            if (shop.isOpen() == false)
                closedShops.append(shop)
            end
        end
        return closedShops
    end


end