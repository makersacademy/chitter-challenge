require 'spec_helper'

feature 'signing up' do
  scenario 'a user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'testpwd123')
    fill_in('username', with: 'tester')
    click_button('Sign up now')

    expect(page).to have_content "Welcome, tester"
  end
end
