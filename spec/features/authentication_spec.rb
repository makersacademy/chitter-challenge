feature 'authentication' do
  scenario 'a user can sign in' do
    # Create a test user
    User.create(
      :username => 'test',
      :email => 'test@example.com',
      :password => 'password123',
      :password_confirmation => 'password123',
      :name => 'password123'
    )
    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome test'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(
      :username => 'test',
      :email => 'test@example.com',
      :password => 'password123',
      :password_confirmation => 'password123',
      :name => 'password123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(
      :username => 'test',
      :email => 'test@example.com',
      :password => 'password123',
      :password_confirmation => 'password123',
      :name => 'password123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test'
    expect(page).to have_content 'Please check your email or password.'
  end
  scenario 'a user can sign out' do
    User.create(
      :username => 'test',
      :email => 'test@example.com',
      :password => 'password123',
      :password_confirmation => 'password123',
      :name => 'password123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test'
    expect(page).to have_content 'You have signed out.'
  end
end
