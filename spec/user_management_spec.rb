require 'spec_helper'
require_relative 'web_helper'

feature 'sign up' do
  scenario 'adds user to database' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('You are currently signed in as New User')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'does not add user when email is invalid' do
    expect {invalid_email_sign_up}.not_to change(User, :count)
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end
end
