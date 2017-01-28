require './spec/spec_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
#
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'sign in' do
  scenario 'if I am a user I can sign in' do
    sign_up
    visit('/sign_in')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Welcome m1k3')
  end
end
