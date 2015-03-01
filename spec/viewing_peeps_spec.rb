require 'spec_helper'

feature "User views the peeps" do

  before(:each) {
    Peep.create(:text => "Hello Chitter!")
  }

  scenario "when opening the homepage" do
    visit('/')
    expect(page).to have_content("Hello Chitter!")
  end
end
