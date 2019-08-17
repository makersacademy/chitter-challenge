require 'pg'
require_relative '../web_helpers'

feature 'adding a new peep' do

  scenario 'a user can post a peep' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    signin

    fill_in('content', with: 'This is my first peep')
    click_button "submit"

    expect(page).to have_content "This is my first peep"
  end
end
