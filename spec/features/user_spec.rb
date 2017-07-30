require 'web_helper'

feature 'User sign in / sign up:' do
  let(:email) { 'user@user.com' }
  let(:password) { '123' }

  scenario 'I can sign up with new email and pass' do
    sign_up
    expect(page).to have_content("Howdy #{email}")
  end

  scenario 'I cannot sign up if password confirmation does not match' do
    visit('/user/new')
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: '124'
    click_button 'Sign Up'
    expect(page).to have_content("Please sign up")
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I can login if was registered before' do
    sign_up
    click_button 'Logout'
    visit('/user/login')
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign In'
    expect(page).to have_content("Howdy user@user.com")
  end
end
