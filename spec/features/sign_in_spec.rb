require 'spec_helper'

feature 'User sign in' do

  scenario 'an existing user signs in' do
    sign_up_correct_password
    visit '/sessions/new'
    fill_in('email', with: 'matt@matt.com')
    fill_in('password', with: 'vickers')
    click_button('Sign in')
    expect(page).to have_content("Welcome, matt@matt.com")
  end
end
