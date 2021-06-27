feature 'Authentication' do
  scenario 'a user can log in with email and password' do
    log_in_with_test_user_1

    expect(page).to have_content 'Welcome, Test Name (@testuser1)'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

    visit '/sessions/new'
    fill_in :email, with: 'incorrect_email@example.com'
    fill_in :password, with: 'password123'
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, Test Name (@testuser1)'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

    visit '/sessions/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'wrongpassword'
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, Test Name (@testuser1)'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can access log in from the peeps page' do
    visit '/peeps'
    click_button('Log in')
    
    expect(page).to have_content 'Log in'
  end

  scenario 'a user can log out' do
    log_in_with_test_user_1
    click_button('Log out')

    expect(page).not_to have_content 'Welcome, Test Name (@testuser1)'
    expect(page).not_to have_button 'Log out'
    expect(page).to have_button 'Log in'
  end
end
