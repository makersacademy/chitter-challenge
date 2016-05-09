require 'spec_helper'

feature 'A user logs in to Chitter' do
  scenario 'The user enters their email and password' do
    sign_up
    log_in
    expect(page).to have_content('Welcome, Jeremy!')
  end
end
