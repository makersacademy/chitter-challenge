require 'spec_helper'

feature 'allow user to register account' do
  scenario 'sign up user' do
    visit ('/')
    click_button('Sign Up')
    fill_in 'username', with: 'matsam'
    fill_in 'email', with: 'matsam@makers.com'
    fill_in 'password', with: '123abc'
    fill_in 'password_confirmation', with: '123abc'
  end
end
