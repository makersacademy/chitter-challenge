require './spec/spec_helper'
require './spec/test_helpers'

feature 'logout' do
  scenario 'user is able to log out' do
    create_user_log_in
    click_link 'Log out'
    expect(page).to_not have_content 'Welcome, User!'
  end
end
