require_relative 'web_helper'

feature 'allows sign in' do
  scenario 'sign in with correct creditentials' do
    register_new_user
    visit '/sessions/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password')
    click_button 'log_in'
    expect(page).to have_content 'Welcome, email@gmail.com'
  end
end
