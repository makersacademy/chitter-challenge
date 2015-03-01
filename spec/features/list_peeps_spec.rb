require 'spec_helper'

feature "List peeps on the homepage" do

  before(:each) {
    User.create(id: 1,
                email: 'test@test.com',
                username: 'JimJim')
    Peep.create(text: 'This is My Peep',
                user_id: 1)
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("This is My Peep")
  end


end