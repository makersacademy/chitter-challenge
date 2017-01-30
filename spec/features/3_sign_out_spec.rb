require 'spec_helper'

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'FEATURE 3: Sign out' do

  before(:each) do
    User.create(user_email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario '3A) While already signed in' do
    sign_in(user_email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
