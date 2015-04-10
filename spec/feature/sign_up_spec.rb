require 'user'
require 'byebug'

feature 'User signs up' do
  scenario 'sign up' do
    visit('/')
    expect(current_path).to eq('/welcome/')
    expect(User.count).to eq 0
    find_button('Sign Up').click
    expect(current_path).to eq('/signup/')
    sign_up
    expect(current_path).to eq('/')
    expect(User.count).to eq 1
    expect(page).to have_content('Welcome, ' + User.first.email)
  end

  xscenario 'can not sign in with incorrect log in details'
end
