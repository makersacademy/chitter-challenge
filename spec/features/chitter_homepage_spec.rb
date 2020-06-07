require 'spec_helper'
require 'pg'

feature 'A user can sign up' do
  scenario 'A user can enter username and password to sign up' do
    visit('/')
    fill_in :username, with: 'RichEwin'
    fill_in :password, with: 'test'
    click_button 'Sign up'
    expect(page).to have_content 'Thanks for signing up'
  end
end
