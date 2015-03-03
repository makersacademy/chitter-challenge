require 'spec_helper'

feature "User browses the peeps!" do

  before(:each) {
    Peep.create(:message => "Hello there!")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Hello there!")
  end

end