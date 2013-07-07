require 'spec_helper'

describe "Hotel pages" do

  subject { page }

  describe "Top page" do

    before { visit root_path }

    it { should have_selector('title', text: full_title("Top 5")) }   
  end

  describe "Index page" do

    before { visit hotels_path }
 
    it { should have_selector('title', text: full_title("All Hotels")) }    
  end

  describe "new" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user 
      visit new_hotel_path
    end


    it { should have_selector('h1',    text: 'New Hotel') }
    it { should have_selector('title', text: full_title('New Hotel')) }

    let(:submit) { "Create" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Hotel, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'New Hotel') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "hotel_title",        with: "Title1"
        check   "hotel_breakfast"
        fill_in "hotel_description",  with: "Some Description"
        fill_in "hotel_price",        with: "100.50"
      end

      it "should create a hotel" do
        expect { click_button submit }.to change(Hotel, :count).by(1)
      end

      describe "after saving the hotel" do
        before { click_button submit }
        let(:hotel) { Hotel.find_by_title("Title1") }

        it { should have_selector('div.alert.alert-success', text: 'Step 1 of 2!') }

      end
    end
  end
end