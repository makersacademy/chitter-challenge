require './spec/web_helper'

feature 'log in' do

  scenario 'allows users to log in once they have an account' do
    sign_up_good
    click_button 'Log Out'
    fill_in 'username', with: 'SidTheSloth'
    fill_in 'password', with: 'password123'
    click_button 'Log In'
    expect(page).to have_content 'SidTheSloth is logged in'

  end

  scenario 'after log in there should be no option to sign up or log in' do
    sign_up_good
    expect(page).not_to have_button 'Log In'
    expect(page).not_to have_button 'Sign Up'
  end
end
