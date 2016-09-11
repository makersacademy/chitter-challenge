require 'spec_helper'
require 'web_helper'

feature 'sign up' do
  scenario 'adds user to database' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('You are currently signed in as New User')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'does not add user when no username is entered' do
    expect {no_username_sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'does not add user when user is already taken' do
    sign_up
    expect {sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Username is already taken')
  end

  scenario 'does not add user when no email is entered' do
    expect {no_email_sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'does not add user when email is invalid' do
    expect {invalid_email_sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'does not add user when email is already taken' do
    sign_up
    expect {sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end

  scenario 'does not add user when password field is empty' do
    expect {no_password_sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password must not be blank')
  end

  scenario 'does not add user when passwords do not match' do
    expect {not_matching_passwords_sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end

end

feature 'sign in' do
  scenario 'users with accounts can sign in' do
    sign_up
    sign_in
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'You are currently signed in as New User'
    expect(current_path).to eq '/'
  end

  scenario 'user cannot sign in with incorrect password' do
    sign_up
    click_button('logout?')
    incorrect_sign_in
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/sessions/new'
    expect(page).not_to have_content 'You are currently signed in as New User'
  end
end

feature 'signing out' do
    scenario 'it signs out user' do
    sign_up
    click_button('logout?')
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/sessions/new'
    expect(page).not_to have_content 'You are currently signed in as New User'
  end
end
