require 'web_helper'

feature 'User sign in / sign up:' do
  let(:email) { 'user@user.com' }
  let(:password) { '123' }

  scenario 'Correct sign up' do
    sign_up
    expect(page).to have_content("Howdy #{email}")
  end

  scenario 'Password and confirmation do not match' do
    visit('/user/new')
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: '124'
    click_button 'Sign Up'
    expect(page).to have_content("Please sign up")
    expect(page).to have_content("Password and confirmation password do not match")
  end

  scenario 'Correct login' do
    sign_up
    click_button 'Logout'
    visit('/user/login')
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign In'
    expect(page).to have_content("Howdy user@user.com")
  end
end
