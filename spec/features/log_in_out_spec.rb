feature 'Log in/out' do
  scenario 'Logged in user can log out' do
    register_user
    click_button 'Log out'
    expect(page).not_to have_content('Welcome Test User')
    expect(page).to have_button('Log in')
  end
  scenario 'User can log in with valid credentials' do
    register_user
    log_out

    visit '/'
    fill_in 'username', with: 'unique_user'
    fill_in 'password', with: 'h3ll0wor!d'
    click_button 'Log in'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome Test User')
  end

  scenario 'User cannot log in with invalid credentials' do
    register_user
    log_out

    visit '/'
    fill_in 'username', with: 'unique_user'
    fill_in 'password', with: 'incorrectpassword'
    click_button 'Log in'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Invalid credentials')
    expect(page).not_to have_content('Welcome Test User')
  end
end
