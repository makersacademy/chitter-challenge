require './spec/web_helper'

feature 'log out' do
  scenario 'allows the user to log out' do
    sign_up_good
    click_button 'Log Out'
    expect(page).not_to have_content 'SidTheSloth is logged in'
  end
end
