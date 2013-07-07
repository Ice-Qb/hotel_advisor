require 'spec_helper'

describe Rating do
  let(:hotel) { FactoryGirl.create(:hotel) }
  before do
  	@rating = hotel.ratings.build(value: 1.77, comment: "Good!")
  end

  subject { @rating }
  
  it { should respond_to(:value) }
  it { should respond_to(:comment) }
  it { should respond_to(:hotel) }
  it { should respond_to(:hotel_id) }

  it { should be_valid }

  describe "when hotel_id is not present" do
    before { @rating.hotel_id = nil }
    it { should_not be_valid }
  end

  describe "with zero value" do
    before { @rating.value = 0 }
    it { should_not be_valid }
  end

  describe "with blank value" do
    before { @rating.value = nil }
    it { should_not be_valid }
  end

   describe "with blank comment" do
    before { @rating.comment = " " }
    it { should be_valid }
  end

  describe "with comment that is too long" do
    before { @rating.comment = "a" * 501 }
    it { should_not be_valid }
  end
end
