require './app/models/user'
require_relative 'web_helper'

feature 'log out form' do

  before do
    create_account
    log_in
  end

  scenario 'displays log out button when logged in' do
    expect(page).to have_button('log out')
  end

  scenario 'does not display log out button when not logged in' do
    log_out
    expect(page).to_not have_button('log out')
  end
end
