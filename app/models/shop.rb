class Shop < ActiveRecord::Base

  #Callbacks

  #Relationships
  has_many :items
  has_many :requests

  #Validations
  validates :name, presence: true, uniqueness: true #case-sensitive e.g. allows yale and Yale
  validates_time :open_time, :close_time
  validates :state, inclusion: { in: (STATES_LIST.map{|a,b| a} + STATES_LIST.map { |a,b| b }), message: "is not valid state", allow_blank: true }
  #case 1 - if street_1 entered, need a zip to geocode
  validates :zip, presence: true, unless: "street_1.nil?"
  #case 2 - if zip entered, need street 1 to geocode
  validates :street_1, presence: true, unless: "zip.nil?"
  #case 3 - if state is entered - if a zip is entered with it - the zip needs to be 5 digits 
  #and continue to discern the allow_blank...
  validates :zip, format: { with: /\A\d{5}\z/, message: "should be five digits long because an American state was provided", allow_blank: true }, if: :zip_and_state_entered?
  #case 5 - if zip is entered without a state, the zip should then be of Canadian format
  validates :zip, format: { with: /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}\z/, message: "The zip you entered should be of Canadian format because you did not enter a US state", allow_blank: true }, if: :zip_is_entered_without_a_state?

  # #Scopes
  # scope :alphabetical, -> { order('name') }
  # scope :active, -> { where(active: true) }
  # scope :inactive, -> { where(active: false) }

  #Methods
  def zip_and_state_entered?
    return ( !self.zip.nil? && !self.state.nil? )
  end

  def zip_is_entered_without_a_state?
    return ( !self.zip.nil? && self.state.nil? )
  end

end
