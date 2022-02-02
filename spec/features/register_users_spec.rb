require 'pg'

feature 'register users' do
  scenario 'a user can register' do
  
    visit('/')
    click_link('Sign Up')
    visit('/users/new')
    fill_in('username', with: 'Hagrid')
    fill_in('email', with: 'hagrid@gmail.com')
    fill_in('password', with: 'hagrid123')    
    click_button('Sign Up')
  
    
    expect(page).to have_content('Please log in to your account')
  end
end
