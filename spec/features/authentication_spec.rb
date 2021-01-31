feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    User.create('John Doe', 'JDoe', 'test@example.com', 'password123')

    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Hello, John Doe'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create('John Doe', 'JDoe', 'test@example.com', 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create('John Doe', 'JDoe', 'test@example.com', 'password123')

   visit '/sessions/new'
   fill_in(:email, with: 'test@example.com')
   fill_in(:password, with: 'wrongpassword')
   click_button('Sign in')

   expect(page).not_to have_content 'Welcome, test@example.com'
   expect(page).to have_content 'Please check your email or password.'
 end

 scenario 'a user can sign out' do
  User.create('John Doe', 'JDoe', 'test@example.com', 'password123')

  visit '/sessions/new'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'wrongpassword')
  click_button('Sign in')

  # Sign out
  click_button('Sign out')

  expect(page).not_to have_content 'Welcome, test@example.com'
  expect(page).to have_content 'You have signed out.'
 end
end
