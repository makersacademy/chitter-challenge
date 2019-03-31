require 'user_signin_create_helper'

feature 'authentication' do
  scenario 'a user can sign in' do
    create_user
    sign_in
    expect(page).to have_content('Welcome to Chitter, amy123')
  end

  scenario 'user sees an error if they enter an incorrect password' do
    create_user

    visit('/chitter')
    click_button('Sign in')
    fill_in('username', with: 'amy123')
    fill_in('password', with: 'p4ssword')
    click_button('Sign in')
    expect(page).to have_content('Please check your username or password')
  end

  scenario 'user sees an error if they enter an incorrect username' do
    create_user

    visit('/chitter')
    click_button('Sign in')
    fill_in('username', with: 'amy111')
    fill_in('password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Please check your username or password')
  end

  scenario 'user can sign out' do
    create_user

    sign_in

    click_button('Sign out')

    expect(page).not_to have_content('Welcome to Chitter, amy123')
    expect(page).to have_content('Sign out successful')
  end
end
