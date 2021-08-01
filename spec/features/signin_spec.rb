require 'setup_test_database.rb'
require 'spec_helper'

feature 'creating an account' do
  scenario 'user can sign up and sign in' do 
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: 'Frank'
    fill_in 'username', with: 'frank-mck'
    fill_in 'email', with: 'frank@frank.com'
    fill_in 'password', with: 'qwerty1'
    click_button 'Submit'
    expect(page).to have_content('Logged in as, Frank')
  end
end



  