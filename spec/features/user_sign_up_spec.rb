require 'spec_helper'

feature 'A new user signs up to Chitter' do
  scenario 'The user enters their email address, password and confirmation' do
    expect{sign_up}.to change(User, :count)
    expect(page).to have_content("Welcome, Jeremy!")
  end

  scenario 'The user enters an incorrect email' do
    expect{sign_up(email: 'qwerty')}.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'The user leaves the email field blank' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'The user does not correctly confirm their password' do
    expect{sign_up(confirm_password: 'wrong')}.not_to change(User,:count)
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'The user does not enter a name' do
    expect{sign_up(name: nil)}.not_to change(User,:count)
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'The user does not enter a username' do
    expect{sign_up(username: nil)}.not_to change(User,:count)
    expect(page).to have_content('Username must not be blank')
  end
end
