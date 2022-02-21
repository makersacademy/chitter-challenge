feature 'authentication' do
  it 'a user can sign in' do
    user = create_test_user
    # sessions is a RESTful resource - This is standard for signing-in
    sign_in(email: 'test@example.com', password: 'password123')

    expect(page).to have_content ("Welcome, #{user.name}")
  end

  scenario 'a user sees an error if they get their email wrong' do
    create_test_user
    sign_in(email: 'nottherightemail@me.com', password: 'password123')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    user = create_test_user
    sign_in(email: 'test@example.com', password: 'wrongpassword')

    expect(page).not_to have_content ("Welcome, #{user.name}")
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    user = create_test_user
    sign_in(email: 'test@example.com', password: 'password123')

    click_button('Sign out')

    expect(page).not_to have_content ("Welcome, #{user.name}")
    expect(page).to have_content 'You have signed out.'
  end

end
