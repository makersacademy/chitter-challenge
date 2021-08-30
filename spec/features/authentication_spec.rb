require 'spec_helper'

feature 'authentication' do
  it 'a user can sign in' do
    sign_in
    expect(page).to have_content 'Welcome, username'
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_in_with_incorrect_email
    expect(page).not_to have_content 'Welcome, username' 
    expect(page).to have_content 'You have entered incorrect details'
  end

  scenario 'a user sees an error if they get their password wrong' do
    sign_in_with_incorrect_password
    expect(page).not_to have_content 'Welcome, username' 
    expect(page).to have_content 'You have entered incorrect details'
  end

  scenario 'a user can sign out' do
    sign_in
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    page.should_not have_button('Sign out')
  end
end
