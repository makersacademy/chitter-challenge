require 'spec_helper'

feature 'signing up' do
  scenario 'I would like to sign up as a chitter user' do
    visit '/users/new'
    fill_in :first_name, with: 'Daisy'
    fill_in :last_name, with: 'Humphrey'
    fill_in :email, with: 'daisy@awesome.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome, Daisy Humphrey!'
  end
end
