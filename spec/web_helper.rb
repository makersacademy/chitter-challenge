require 'spec_helper'

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,                              with: 'chris@example.com'
  fill_in :name,                               with: 'Christopher Kummelstedt'
  fill_in :user_name,                          with: 'Fluff'
  fill_in :password,                           with: 'fluff'
  fill_in :password_confirmation,              with: 'fluff'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
