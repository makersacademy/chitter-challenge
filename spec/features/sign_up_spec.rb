feature 'Features - Sign Up' do
  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'user wants to sign up' do
    visit('/')
    click_button 'Sign up'
    visit('/signup')
    fill_in :username, with: 'chocolatine'
    fill_in :name, with: 'Mathilde'
    fill_in :email, with: 'mathilde@email.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
  end

end
