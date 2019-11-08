require_relative '../login_helper'
require 'securerandom'

feature 'login' do
  scenario 'should log in correctly' do
    log_in
    expect(page).to have_content('Hi, capybara!')
  end

  scenario 'should log out correctly' do
    log_in
    click_on('Sign out')
    expect(page).to have_content('Log in')
  end

  scenario 'should register correctly' do
    random_string = SecureRandom.hex
    register(random_string)
    expect(page).to have_content("Hi, #{random_string}!")
  end
end
