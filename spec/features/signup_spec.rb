require 'spec_helper'

feature 'Sign up' do
  scenario 'can sign up new user' do
    sign_up(email: 'eric@example.com')
    expect(page).to have_content('You are logged in as eric@example.com')
  end
  scenario 'cannot sign up with mismatched confirmation' do
    sign_up(password_confirmation: 'wrong')
    expect(page).to have_content('Password does not match the confirmation')
  end
  scenario 'cannot sign up with blank email' do
    sign_up(email: nil)
    expect(page).to have_content('Email must not be blank')
  end
  scenario 'cannot sign up with invalid email' do
    sign_up(email: "invalid@email")
    expect(page).to have_content('Email has an invalid format')
  end
  scenario 'cannot sign up with duplicate email' do
    sign_up
    sign_up
    expect(page).to have_content('Email is already taken')
  end
end
