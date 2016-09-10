require 'spec_helper'

feature 'signing up for Chitter' do

  scenario 'user can sign up for Chitter' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Signed in as santaclaus')
  end

  scenario 'user must fill in all fields' do
    expect{sign_up(name: nil)}.to_not change(User, :count)
    expect{sign_up(username: nil)}.to_not change(User, :count)
    expect{sign_up(email: nil)}.to_not change(User, :count)

  end

  scenario 'user must confirm with identical password to sign up' do
    expect{sign_up(password_confirmation: 'blitzen')}.to_not change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'user cannot sign up with already registered email' do
    sign_up
    expect{sign_up(username: 'FatherChristmas')}.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'user cannot sign up with already taken username' do
    sign_up
    expect{sign_up(email: 'father@christmas.com')}.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

end
