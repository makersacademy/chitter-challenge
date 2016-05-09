require 'spec_helper'
require 'web_helpers'

feature 'User sign up' do
  scenario 'with mismatching passwords' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  expect(page).not_to have_content("Hello Ina")
  end

  def sign_up(
    name: "Cookie",
    email: "cookie@test.com",
    password: 1234,
    password_confirmation: 1244)

  visit '/'
  fill_in :name , with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
  end
end