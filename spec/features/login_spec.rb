require_relative './web_helpers'
require 'pry'

feature 'Logging In' do
  scenario 'user can log in with correct username and password' do
    visit('/chitter')
    sign_up
    log_out
    log_in
    expect(page).to have_content("Welcome, Amy")
  end

  scenario 'user cannot log in with wrong username' do
    visit('/chitter')
    sign_up
    log_out
    log_in_wrong_username
    expect(page).to have_content("Log In to Chitter")
  end

  scenario 'user cannot log in with wrong password' do
    visit('/chitter')
    sign_up
    log_out
    log_in_wrong_password
    expect(page).to have_content("Log In to Chitter")
  end
end
