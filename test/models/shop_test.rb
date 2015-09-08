require 'test_helper'

class ShopTest < ActiveSupport::TestCase


  # test relationships
  should have_many(:requests)
  should have_many(:items)

  # Validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should validate_presence_of(:address)
  should validate_uniqueness_of(:address)
  should validate_timeliness_of(:open_time)
  should validate_timeliness_of(:close_time)
 
end
