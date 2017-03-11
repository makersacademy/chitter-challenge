# require 'spec_helper'

feature 'log in functionality' do

  scenario 'user can create an account and sign in with that account info' do
    visit '/'
    click_button 'Sign up'
    fill_in 'Email', with: 'jimmysemail@emailwebsite.com'
    fill_in 'Username', with: 'jimmy324'
    fill_in 'Name', with: 'Jimmy'
    fill_in 'Password', with: 's3cret'
    fill_in 'Confirm Password', with: 's3cret'
    click_button 'Submit'
    expect(page).to have_current_path('/log_in')
    fill_in 'Username', with: 'jimmy324'
    fill_in 'Password', with: 's3cret'
    click_button 'Log in'
    expect(page).to have_current_path('/homepage')
    expect(page).to have_content 'Welcome Jimmy'
  end
end
