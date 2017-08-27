require './app/models/user'
require_relative 'web_helper'

feature 'home page login form' do

  before do
    go_to_login
  end

  scenario 'displays log in form title' do
    expect(page).to have_content('Log In')
  end

  scenario 'displays username input' do
    expect(page).to have_content('username')
  end

  scenario 'displays password input' do
    expect(page).to have_content('password')
  end

  scenario 'displays link to register form' do
    expect(page).to have_link('register new account')
  end
end
