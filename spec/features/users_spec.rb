require 'spec_helper'

feature 'Signing up' do

  scenario 'User can sign up' do
    signup_testuser2
    expect { click_button 'Sign up' }.to change(Users, :count).by 1
  end

  scenario 'Only unique emails and usernames are accepted' do
    signup_testuser1
    click_button 'Sign up'

    visit '/users/signup'
    fill_in 'username', with: 'testuser1'
    fill_in 'name', with: 'Test User'
    fill_in 'email', with: 'testuser1@gmail.com'
    fill_in 'password', with: 'testpassword1'
    fill_in 'password_confirmation', with: 'testpassword2'
    expect { click_button 'Sign up' }.to change(Users, :count).by 0
    expect(page).to have_content 'Username is already taken, Email is already taken, Password does not match the confirmation'
  end

end

feature 'Signing in/out' do

  scenario 'A user can sign in' do
    signup_testuser1
    click_button 'Sign up'
    reset_sessions
    signin_testuser1
    expect(page).to have_content 'Welcome'
  end

  scenario 'Incorrect username/password cannot log in' do
    signup_testuser1
    click_button 'Sign up'
    reset_sessions
    visit '/users/signin'
    fill_in 'username', with: 'testuser1'
    fill_in 'password', with: 'testpassword2'
    click_button 'Sign in'
    expect(page).to have_content 'Wrong username or/and password.'
    reset_sessions
    visit '/users/signin'
    fill_in 'username', with: 'testuser3'
    fill_in 'password', with: 'testpassword1'
    click_button 'Sign in'
    expect(page).to have_content 'Wrong username or/and password.'

  end

end
