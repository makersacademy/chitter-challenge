require 'spec_helper'

feature 'Logging out' do

  scenario 'while being signed in' do
    sign_up
    log_in
    log_out
    expect(page).to have_content('You have been successfully logged out')
    expect(page).not_to have_content('Welcome, Dennis')
  end

end
