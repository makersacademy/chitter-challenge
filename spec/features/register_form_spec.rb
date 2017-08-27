require './app/models/user'
require_relative 'web_helper'

feature 'home page register form' do

  before do
    go_to_register
  end

  scenario 'displays log in form title' do
    expect(page).to have_content('Register New Account')
  end

  scenario 'displays name input' do
    expect(page).to have_content('name')
  end

  scenario 'displays email input' do
    expect(page).to have_content('email')
  end

  scenario 'displays username input' do
    expect(page).to have_content('username')
  end

  scenario 'displays password input' do
    expect(page).to have_content('password')
  end

  scenario 'displays link to login form' do
    expect(page).to have_link('login to existing account')
  end

end
