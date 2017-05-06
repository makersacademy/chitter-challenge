require './spec/spec_helper'

feature 'signup' do
  scenario 'user can signup to chitter' do
    visit '/'
    fill_in 'user_name', with: 'User'
    fill_in 'user_email', with: 'user@usermail.com'
    fill_in 'password', with: '123456'
    click_button 'Create user'
    expect(page).to have_content 'Welcome to Chitter, User!'
  end
end
