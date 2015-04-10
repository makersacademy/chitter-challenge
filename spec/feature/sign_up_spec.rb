require 'user'
require 'byebug'

feature 'User signs up' do
  scenario 'can find and click sign up button on welcome page' do
    visit('/')
    expect(current_path).to eq('/welcome/')
    expect(User.count).to eq 0
    find_button('Sign Up').click
    expect(current_path).to eq('/signup/')
  end

  scenario 'can sign up' do
    sign_up
    expect(current_path).to eq('/')
    expect(User.count).to eq 1
    expect(page).to have_content('Welcome, ' + User.first.email)
  end

  scenario 'can not sign up with passwords that do not match' do
    sign_up('a@a,cin', 'password', 'wrongpassword')
    expect(current_path).to eq('/signup/')
    expect(page).to have_content('Passwords do not match')
  end
end
