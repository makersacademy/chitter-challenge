require_relative './web_helper'

feature 'Log in to chitter' do

  scenario 'enter your user name and password' do
    visit('/sign_up')
    sign_up_one
    log_in_one
    expect(page).to have_content('user name test is currently logged in')
  end

  scenario 'displays no one is currently logged in when no one is logged in' do
    visit('/')
    expect(page).to have_content('no one is currently logged in')
  end
end
