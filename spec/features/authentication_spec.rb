feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123')

    # sessions is a RESTful resource - This is standard for signing-in
    visit_sessions_new_and_sign_in(
      email: 'test@example.com', password: 'password123'
    )

    expect(page).to have_content 'Welcome, test@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123')

    visit_sessions_new_and_sign_in(
      email: 'nottherightemail@me.com', password: 'password123'
    )

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123')

    visit_sessions_new_and_sign_in(
      email: 'test@example.com', password: 'wrongpassword'
    )

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

end