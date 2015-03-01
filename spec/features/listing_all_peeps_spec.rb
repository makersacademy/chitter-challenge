require 'spec_helper'

feature "User browses the list of peeps" do

  before(:each) {
    Peep.create(:user => "Arnold",
                :content => "This is my first peep")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content "This is my first peep"
  end

end