feature 'user login' do
  scenario 'user creates an account' do
    visit('/user/signup')
    fill_in('username', with: 'chitter_tester')
    fill_in('password', with: 'chitter_test_password')
    click_button('Sign up')
    expect(page).to have_content('Welcome to Chitter, chitter_tester!')
  end

  scenario 'user logs into existing account' do
    create_dummy_user
    Capybara.reset_sessions!
    visit('/user/login')
    fill_in('username', with: 'tester')
    fill_in('password', with: 'password1234')
    click_button('Log In')
    expect(page).to have_content('Welcome to Chitter, tester!')
  end

  scenario 'user logs in with wrong username (does not exist)' do
    Capybara.reset_sessions!
    clean_test_database
    visit('/user/login')
    fill_in('username', with: 'notrealuser')
    fill_in('password', with: 'password1234')
    click_button('Log In')
    expect(page).not_to have_content('Welcome to Chitter, test_user!')
    expect(page).to have_content('Invalid username or password - please try again.')
  end

  scenario 'user sees an error if logging in with wrong password' do
    Capybara.reset_sessions!
    clean_test_database
    create_dummy_user
    visit('/user/login')
    fill_in('username', with: 'tester')
    fill_in('password', with: 'wrongpassword')
    click_button('Log In')
    expect(page).not_to have_content('Welcome to Chitter, tester!')
    expect(page).to have_content('Invalid username or password - please try again.')
  end
end
