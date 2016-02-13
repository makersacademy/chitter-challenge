require './spec/web_helper'

feature 'log in' do

  xscenario 'allows users to log in once they have an account' do
    sign_up_good
    click_button 'Log Out'
    fill_in 'username', with: 'SidTheSloth'
    fill_in 'password', with: 'password123'
    click_button 'Log In'

  end
end
