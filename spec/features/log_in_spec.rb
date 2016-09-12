require 'spec_helper'

feature 'registering users' do

  scenario 'sign in a user' do
    sign_up
    log_in
    expect(page).to have_content 'Welcome, Dennis'
  end

  scenario 'signed in user persists until log out' do
    sign_up
    log_in
    visit '/'
    expect(page).to have_content('Welcome, Dennis')
  end

end
