require 'spec_helper'

feature 'User sign up' do

  scenario 'User clicks Sign Up button to sign up as a new user' do
    visit '/peeps'
    click_button 'Sign Up'
    expect(page).to have_content 'Sign up as a new user'
  end

  scenario 'User can sign up with their name, username, email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, tadan!'
    expect(page).not_to have_button 'Sign Up'
    expect(page).not_to have_button 'Sign In'
  end

  scenario 'User cant sign up when passswords do not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

end
