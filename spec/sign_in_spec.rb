require 'spec_helper'

feature 'User can sign in' do

  before do
    create_user
  end

  scenario 'with correct password and email' do
    visit 'sessions/new'
    fill_in :email, with: 'colin@colin.com'
    fill_in :password, with: 'colinpw'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome colinu'
  end
end

