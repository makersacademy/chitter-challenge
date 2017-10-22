require_relative 'spec_helper'
feature 'User login' do
  scenario 'User tries to login succesfully' do
    sign_up_as_mormolis
    fill_in :username, with: 'mormolis'
    fill_in :password, with: '121212'

    click_button 'Log in!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Hello mormolis!"
  end

  scenario 'User tries to login with non existing account' do
    visit('/login') 
    fill_in :username, with: 'nobody'
    fill_in :password, with: '121212'
    click_button 'Log in!'

    expect(current_path).to eq '/login'
    expect(page).to have_content 'The email or password is incorrect'
  end
end
    