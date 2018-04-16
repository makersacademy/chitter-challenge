require_relative './web_helpers.rb'

describe 'logging in', type: :feature do
  scenario 'a user logs in with valid credentials' do
    register
    click_button 'log out'
    click_button 'log in'
    fill_in 'username', with: 'arvo_k'
    fill_in 'password', with: 'trex89D'
    click_button 'submit'
    expect(page).to have_content 'Hello, arvo_k'
  end

  scenario 'a user attempts to log in with invalid password' do
    register
    click_button 'log out'
    click_button 'log in'
    fill_in 'username', with: 'arvo_k'
    fill_in 'password', with: 'random'
    click_button 'submit'
    expect(page).to have_content 'ERROR: invalid credentials'
  end
  
  scenario 'a user attempts to log in with invalid username' do
    register
    click_button 'log out'
    click_button 'log in'
    fill_in 'username', with: 'mairis'
    fill_in 'password', with: 'trex89D'
    click_button 'submit'
    expect(page).to have_content 'ERROR: invalid credentials'
  end
end
