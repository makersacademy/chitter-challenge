require './app/models/user'
require_relative 'web_helper'

feature 'log in action' do

  before do
    create_account
  end

  scenario 'informs user about incorrect username' do
    go_to_login
    fill_in :username, with: 'tezt'
    fill_in :password, with: 'password1'
    click_button('Submit')
    expect(page).to have_content('incorrect username or password')
  end

  scenario 'informs user about incorrect password' do
    go_to_login
    fill_in :username, with: 'test'
    fill_in :password, with: 'password2'
    click_button('Submit')
    expect(page).to have_content('incorrect username or password')
  end
end
