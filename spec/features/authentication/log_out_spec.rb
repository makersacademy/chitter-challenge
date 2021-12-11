require 'spec_helper'

feature 'Logging out' do
  scenario 'logs user out' do
    sign_up
    log_in
    click_button 'Log Out'
    expect(page).to have_selector(:button, 'Log In')
  end
end
