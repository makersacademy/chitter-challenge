require './app/models/user'
require_relative 'web_helper'

feature 'register account action' do

  before do
    create_account
  end

  scenario 'has user table entry' do
    expect(User.first(username: 'test')).to_not eq(nil)
  end

  scenario 'can not duplicate usernames' do
    create_account
    expect(page).to have_content('username exists already')
  end

  scenario 'can not duplicate emails' do
    create_account
    expect(page).to have_content('email address exists already')
  end
end
