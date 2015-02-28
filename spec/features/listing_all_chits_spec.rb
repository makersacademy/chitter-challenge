require 'spec_helper'

feature "User browses the list the chits" do

  before(:each) {
    Chit.create(:username => "@Diego",
                :text => "Chit is the real thing")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Chit is the real thing")
  end
end

