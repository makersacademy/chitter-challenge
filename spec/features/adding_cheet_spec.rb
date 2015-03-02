require 'spec_helper'

feature "listing all cheets" do

  before(:each) {
    Cheet.create(:text => "My first cheet")
  }

    scenario "when opening the home page" do
      visit('/')
      expect(page).to have_content("My first cheet")
    end
end

