# require 'spec_helper'

feature 'log in functionality' do

  scenario 'user can create an account and sign in with that account info' do
    go_to_sign_up
    enter_sign_up_info_and_submit
    expect(page).to have_current_path('/log_in')
    fill_in 'Username', with: 'jimmy324'
    fill_in 'Password', with: 's3cret'
    click_button 'Log in'
    expect(page).to have_current_path('/homepage')
    expect(page).to have_content 'Welcome Jimmy'
  end

  scenario 'user tries to log in without creating an account' do
    visit '/'
    log_in
    expect(page).to have_content 'User jimmy324 does not exist'
  end

  scenario 'user tries to log in with wrong password' do
    go_to_sign_up
    enter_sign_up_info_and_submit
    expect(page).to have_current_path('/log_in')
    fill_in 'Username', with: 'jimmy324'
    fill_in 'Password', with: 'wrong password'
    click_button 'Log in'
    expect(page).to have_content 'Password Incorrect'
  end

  scenario 'user can log in as a guest' do
    visit '/'
    click_button 'Sign in as Guest'
    expect(page).to have_content 'Welcome Guest'
  end

  scenario 'User cannot sign up if the username or email they enter are already in use' do
    go_to_sign_up
    enter_sign_up_info_and_submit
    expect(page).to have_current_path('/log_in')
    click_link 'Sign up'
    enter_sign_up_info_and_submit
    expect(page).to have_current_path('/sign_up')
    expect(page).to have_content 'Username is taken'
    fill_in 'Email', with: 'jimmysemail@emailwebsite.com'
    fill_in 'Username', with: 'jimmy325'
    fill_in 'Name', with: 'Jimmy'
    fill_in 'Password', with: 's3cret'
    fill_in 'ConfirmPassword', with: 's3cret'
    click_button 'Submit'
    expect(page).to have_current_path('/sign_up')
    expect(page).to have_content 'An account already exists with this Email'
  end

  scenario 'User tries to sign up but writes different things in the Password and Confirm Password boxes' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jimmysemail@emailwebsite.com'
    fill_in 'Username', with: 'jimmy324'
    fill_in 'Name', with: 'Jimmy'
    fill_in 'Password', with: 's3cret'
    fill_in 'ConfirmPassword', with: 'secret'
    click_button 'Submit'
    expect(page).to have_current_path('/sign_up')
    expect(page).to have_content 'Confirm Password must match Password'
  end

  scenario 'User cannot add peeps while signed in as a guest' do
    visit '/'
    click_button 'Sign in as Guest'
    expect(page).to have_current_path('/homepage')
    expect(page).not_to have_css('a[href="/peep/new"]')
  end

  scenario 'User can add a new peep' do
    go_to_sign_up
    enter_sign_up_info_and_submit
    log_in
    click_link 'New Peep'
    fill_in 'Content', with: 'test content for a new peep'
    click_button 'Peep'
    expect(page).to have_current_path('/homepage')
    expect(page).to have_content('jimmy324: test content for a new peep')
  end
end
