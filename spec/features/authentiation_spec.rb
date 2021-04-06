feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    User.create(email: 'test@example.com', password: 'password123', name: 'test', username: 'testing123')

    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'test', username: 'testing123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'test', username: 'testing123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    # Create the user
    User.create(email: 'test@example.com', password: 'password123', name: 'test', username: 'testing123')

    # Sign in as that user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # Sign out
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test'
    expect(page).to have_content 'You have signed out.'
  end

end
