require 'spec_helper'

feature "User can browse recent peeps" do

  before(:each) do 

    Peep.create(:content => "hello")
    Peep.create(:content => "goodbye")
    Peep.create(:content => "have a nice day")
    Peep.create(:content => "awful weather")
  
    scenario "when opening the home page" do
      visit '/'
      expect(page).to have_content("hello")
      expect(page).to have_content("goodbye")
      expect(page).to have_content("have a nice day")
      expect(page).to have_content("awful weather")
    end
  end
end


