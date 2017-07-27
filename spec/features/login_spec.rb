require_relative '../web_helpers'

feature 'login with email and password' do
  scenario 'I can sign up as a new user' do
    sign_up(username: 'Ryan')
    expect(page).to have_content('Welcome, Ryan')
  end
end
