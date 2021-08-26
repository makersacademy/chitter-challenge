require 'spec_helper'

feature 'authentication' do
  it 'a user can sign in' do
    sign_in
    expect(page).to have_content 'Welcome, username'
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_in
    expect(page).not_to have_content 'Welcome, username' 
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@test.com', password: 'password123', name: 'testname', username: 'username')
    sign_in
    expect(page).not_to have_content 'Welcome, username' 
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    sign_in
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    page.should_not have_button('Sign out')
  end
end
