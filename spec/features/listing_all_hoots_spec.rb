require 'spec_helper'

feature "User browses the list of hoots" do

before(:each) {
    Hoot.create(:username => "Carrie123", :message => "Hoot Hoot!")
    Hoot.create(:username => "John8", :message => "First Hoot ever!")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Hoot Hoot!")
  end

end