require 'web_helpers'

feature 'sign in' do
  scenario 'user visits homepage and signs up then signs in and is redirected to the peep page that shows they are logged in' do
    clear_table
    visit '/'
    click_button 'Sign Up'
    fill_in :email, with: 'ollie@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Sign Up'
    click_button 'Sign In'
    fill_in :email, with: 'ollie@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Sign In'
    expect(page).to have_content 'You are logged in as ollie@gmail.com'
  end
end
