require './spec/spec_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter


feature 'sign in' do
  scenario 'if I am a user I can sign in' do
    sign_in
    expect(page).to have_content('Welcome m1k3')
  end
  scenario 'sign in wrong password' do
    sign_in
    click_button('Log out')
    click_button('Sign In!')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'wrong')
    click_button('Sign in')
    expect(page).to have_content('The email or password is incorrect')
  end
end
