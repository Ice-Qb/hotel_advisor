require 'spec_helper'

describe Address do
  let(:hotel) { FactoryGirl.create(:hotel) }
  before do
  	@address = Address.create(nation: "The nation", state: "The state",
  		city: "Chicago", street: "9826 Jolly Drive", hotel_id: hotel.id)
  end

  subject { @address }
  
  it { should respond_to(:nation) }
  it { should respond_to(:state) }
  it { should respond_to(:city) }
  it { should respond_to(:street) }
  it { should respond_to(:hotel_id) }
  it { should respond_to(:hotel) }

  its(:hotel) { should == hotel }
  it { should be_valid }

  describe "when hotel_id is not present" do
    before { @address.hotel_id = nil }
    it { should_not be_valid }
  end

  describe "with blank nation" do
    before { @address.nation = " " }
    it { should_not be_valid }
  end

  describe "with nation that is too long" do
    before { @address.nation = "a" * 101 }
    it { should_not be_valid }
  end

  describe "with blank state" do
    before { @address.state = " " }
    it { should_not be_valid }
  end

  describe "with state that is too long" do
    before { @address.state = "a" * 101 }
    it { should_not be_valid }
  end

  describe "with blank city" do
    before { @address.city = " " }
    it { should_not be_valid }
  end

  describe "with city that is too long" do
    before { @address.city = "a" * 101 }
    it { should_not be_valid }
  end

  describe "with blank street" do
    before { @address.street = " " }
    it { should_not be_valid }
  end

  describe "with street that is too long" do
    before { @address.street = "a" * 101 }
    it { should_not be_valid }
  end
end
