require './spec/web_helper'

feature 'log out' do
  scenario 'allows the user to log out' do
    sign_up_good
    click_button 'Log Out'
    expect(page).not_to have_content 'SidTheSloth is logged in'
  end

  scenario 'expect not to have option to log out after log out' do
    sign_up_good
    click_button 'Log Out'
    expect(page).not_to have_button 'Log Out'
  end
end
