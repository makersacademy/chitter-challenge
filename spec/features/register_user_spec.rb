feature 'Register user' do
  scenario 'User registration with unique username and email is successful' do
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: '123@email.com'
    fill_in 'username', with: 'my_username'
    fill_in 'name', with: 'Test User'
    fill_in 'password', with: 'h3ll0wor!d'
    click_button 'Sign up'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome Test User')
  end
end
