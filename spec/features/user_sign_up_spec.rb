require_relative '../web_helpers'

feature 'user sign up' do
  scenario 'user can regsister as a new user' do
    sign_up 
    expect(page).to have_content 'Hi axcochrane! You have successfully signed up!'
  end
end