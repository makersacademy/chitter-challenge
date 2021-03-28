feature 'authentication' do
  User.create('test_auth@example.com', 'password123', 'test_auth', 'test_auth')

  scenario 'a user can sign in' do
    visit('/sessions/new')
    fill_in(:email, with: 'test_auth@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test_auth'
  end

  scenario 'error with wrong email' do
    visit('/sessions/new')
    fill_in(:email, with: 'notrightemail@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to_not have_content 'Welcome, test_auth'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'error with wrong password' do
    visit('/sessions/new')
    fill_in(:email, with: 'test_auth@example.com')
    fill_in(:password, with: 'wrongpass')
    click_button('Sign in')

    expect(page).to_not have_content 'Welcome, test_auth'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'user can sign out' do
    visit('/sessions/new')
    fill_in(:email, with: 'test_auth@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_link('Sign out')

    expect(page).to_not have_content 'Welcome, test_auth'
  end
end
