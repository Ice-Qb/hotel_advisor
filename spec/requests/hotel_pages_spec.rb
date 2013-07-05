require 'spec_helper'

describe "Hotel pages" do

  subject { page }

  describe "Top page" do

    before { visit root_path }

    it { should have_selector('title', text: "Hotel Advisor | Top 5") }   
  end

  describe "Index page" do

    before { visit hotels_path }

    it { should have_selector('h1',    text: "All Hotels") }  
    it { should have_selector('title', text: "Hotel Advisor | All Hotels") }    
  end
end