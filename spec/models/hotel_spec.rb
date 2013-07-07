require 'spec_helper'

describe Hotel do

  let(:user) { FactoryGirl.create(:user) }
  let(:address) { FactoryGirl.create(:address) }
  before { @hotel = user.hotels.build(title: "Some Hotel",
  	breakfast: false, description: "Low prices.", price: 25.0) }
 

  subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:breakfast) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:address) }

  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Hotel.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it "should not allow access to address" do
      expect do
        Hotel.new(address: address)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @hotel.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @hotel.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @hotel.title = "a" * 101 }
    it { should_not be_valid }
  end
  
  describe "with blank description" do
    before { @hotel.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @hotel.description = "a" * 701 }
    it { should_not be_valid }
  end

  describe "price less than zero" do
    before { @hotel.price = -2 }
    it { should_not be_valid }
  end

end
