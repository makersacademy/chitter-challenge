require 'web_helpers'

feature 'sign up' do
  scenario 'user visits homepage and signs up and is redirected to home page' do
    clear_table
    visit '/'
    click_button 'Sign Up'
    fill_in :email, with: 'ollie@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Sign Up'
    expect(page).to have_content 'Not registered? Sign up here'
  end
end
