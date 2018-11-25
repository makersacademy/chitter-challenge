require_relative '../../lib/models/user'
feature 'authentication' do
  scenario 'a user can sign in' do
    # Create a test user
    User.create(user_name: '@testuser',
                email: 'test_email@not_real.com',
                password: 'password123',
                name: 'Joe Bloggs')


    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test_email@not_real.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, @testuser'
  end

  scenario 'User sees error if they get their email wrong' do
    User.create(user_name: '@testuser',
                email: 'test_email@not_real.com',
                password: 'password123',
                name: 'Joe Bloggs')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, @testuser'
    expect(page).to have_content 'Please check your email or password.'
  end
end
