require 'spec_helper'
require './app/app.rb'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'sign up as a new user' do
    expect{signup}.to change(User, :count).by (1)
    expect(page).to have_content('Welcome, Bobby')
    expect(User.first.email).to eq("test@test.com")
  end

  scenario 'email already taken' do
    signup
    expect{signup}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'username already taken' do
    signup
    expect{signup}.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'password mismatch' do
    expect{sign_up_bad_pw}.not_to change(User, :count)
    expect(page).not_to have_content('Welcome, evil_kitty@dogslife.com')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'blank email address' do
    expect{sign_up_bad('')}.not_to change(User, :count)
    sign_up_bad('')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'invalid email address' do
    expect{sign_up_bad('i am not an email')}.to change(User, :count).by(0)
    sign_up_bad('i am not an email')
    expect(page).to have_content('Email has an invalid format')
  end
end
