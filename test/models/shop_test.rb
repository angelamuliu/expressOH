require 'test_helper'

class ShopTest < ActiveSupport::TestCase


  # test relationships
  should have_many(:requests)
  should have_many(:items)

  # Validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should allow_value("PA").for(:state)
  should allow_value("WV").for(:state)
  should allow_value("OH").for(:state)
  should allow_value("CA").for(:state)
  should allow_value("Texas").for(:state)
  should_not allow_value("bad").for(:state)
  should_not allow_value(10).for(:state)

  should allow_value("03431").for(:zip)
  should allow_value("15217").for(:zip)
  should allow_value("15090").for(:zip)

  should_not allow_value("3431").for(:zip)
  should_not allow_value("152179").for(:zip)
  should_not allow_value("profh").for(:zip)


  # #Scopes
  # should "shows shops in alphabetical order" do
  #   assert_equal ["shop_1", "shop_2"] Shop.alphabetical.all.map{|s| s.name}
  # end

  # should "show that there are X active shops" do
  #   assert_equal 3, Shop.active.size
  #   assert_equal ["shop_1"], Shop.active.all.map{|s| s.name}.sort
  # end

  # should "shows that there are X inactive shops" do
  #   assert_equal 1, Shop.inactive.size
  #   assert_equal ["Mastering Chess Tactics"], Shop.inactive.all.map{|s| s.name}.sort
  # end


  # #Methods

  # #Location #commented-out in dev branch to save testing time

  #   should "properly identify the coordinates of the organizations" do
  #     assert_in_delta(40.4533665, @somerset.latitude, 0.0001)
  #     assert_in_delta(-80.0030653, @somerset.longitude, 0.0001)
  #     assert_in_delta(40.4533665, @grove_city.latitude, 0.0001)
  #     assert_in_delta(-80.0030653, @grove_city.longitude, 0.0001)
  #     deny @acac.latitude.nil?
  #     deny @acac.longitude.nil?
  #   end

  #   should "show that a US state must have an exactly 5 digit zip" do
  #     bad_org = FactoryGirl.build(:organization, name: "bad org", short_name: "bo", zip: "123456")
  #     deny bad_org.valid?
  #     good_org = FactoryGirl.build(:organization, name: "generic org", short_name: "go")
  #     assert good_org.valid?
  #   end

  #   should "show that conditional zip and street_1 is working" do
  #     #state is provided in Factory, so zip will be 5 digit American format here
  #     #testing validations cases 1 and 2
  #     street_1_and_zip = FactoryGirl.build(:organization, name: "s&z", street_1: "1 st", zip: "15213")
  #     assert street_1_and_zip.valid?
  #     street_1_wo_zip = FactoryGirl.build(:organization, name: "org", street_1: "1 street", zip: nil)
  #     deny street_1_wo_zip.valid?
  #     zip_wo_street_1 = FactoryGirl.build(:organization, name: "org", street_1: nil, zip: "12345")
  #     deny zip_wo_street_1.valid?
  #   end

  #   should "indirectly test zip_and_state_entered? private method" do
  #     generic_org = FactoryGirl.build(:organization, name: "generic org", short_name: "go")
  #     assert ( !generic_org.zip.nil? && !generic_org.state.nil? )
  #   end

  #   should "indirectly test zip_is_entered_without_a_state? private method" do
  #     generic_org = FactoryGirl.build(:organization, name: "generic org", short_name: "go", state: nil)
  #     assert ( !generic_org.zip.nil? && generic_org.state.nil? )
  #   end

  #   should "show that it is ok to enter a state with no zip AND no street_1" do
  #     generic_org = FactoryGirl.build(:organization, name: "generic org", short_name: "go", zip: nil, street_1: nil)
  #     assert generic_org.valid?
  #   end

  
  #   should "show that if state is entered - if a zip is entered with it - the zip needs to be 5 digits" do
  #     generic_us_org = FactoryGirl.build(:organization, name: "generic org", short_name: "go")
  #     assert generic_us_org.valid?
  #     try_canadian_zip_with_state = FactoryGirl.build(:organization, name: "generic org", short_name: "go", zip: "X1X 1X1")
  #     deny try_canadian_zip_with_state.valid?
  #   end

  #   should "show that if zip is entered without a state, the zip should then be of Canadian format" do
  #     us_zip_wo_state = FactoryGirl.build(:organization, name: "generic org", short_name: "go", state: nil)
  #     deny us_zip_wo_state.valid?
  #     no_state_so_canadian_zip = FactoryGirl.build(:organization, name: "generic org", short_name: "go", state: nil, zip: "X1X 1X1")
  #     assert no_state_so_canadian_zip.valid?
  #     no_state_but_random_wrong_zip = FactoryGirl.build(:organization, name: "generic org", short_name: "go", state: nil, zip: "X1X 1X1 lalala")
  #     deny no_state_but_random_wrong_zip.valid?
  #   end
end
