require 'spec_helper'

feature 'User sign out' do

  scenario 'session forgets id when user logs out' do
    sign_up
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content('Thanks for visiting Chitter, see you again soon')
  end

end
