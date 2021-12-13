require 'setup_test_database.rb'
require 'spec_helper'

feature 'creating an account' do
  scenario 'user can sign up and sign in' do 
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: 'Waqas'
    fill_in 'username', with: 'waqas-i'
    fill_in 'email', with: 'waqas@waqas.com'
    fill_in 'password', with: 'qwerty1'
    click_button 'Submit'
    expect(page).to have_content('Logged in as, Waqas')
  end
end



  