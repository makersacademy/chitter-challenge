feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    User.create(
      email: 'test00@example.com',
      password: 'password123',
      realname: 'Mike Turner',
      username: '@MikeTuner123'
    )

    # Then sign in as them
    visit '/sessions/new'
    fill_in(:input_email, with: 'test00@example.com')
    fill_in(:input_password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test@example.com'
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(
      email: '000test@example.com',
      password: 'password123',
      realname: 'james mcknighty',
      username: '@jamesmcknighty'
    )

    visit '/sessions/new'
    fill_in(:input_email, with: 'nottherightemail@me.com')
    fill_in(:input_password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  feature 'authentication' do
    it 'a user sees an error if they get their password wrong' do
      User.create(
        email: 'tester1@example.com',
        password: 'password123',
        realname: 'box parker',
        username: '@therealbox'
      )

      visit '/sessions/new'
      fill_in(:input_email, with: 'tester1@example.com')
      fill_in(:input_password, with: 'wrongpassword')
      click_button('Sign in')

      expect(page).not_to have_content 'Welcome, test@example.com'
      expect(page).to have_content 'Please check your email or password.'
    end
  end

end
