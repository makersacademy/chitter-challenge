require_relative '../../lib/models/user'
feature 'authentication' do

  before :each do
    # Create a test user
    User.create(user_name: '@testuser',
                email: 'test_email@not_real.com',
                password: 'password123',
                name: 'Joe Bloggs')
  end

  scenario 'a user can sign in' do
    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test_email@not_real.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, @testuser'
  end

  scenario 'User sees error if they get their email wrong' do
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, @testuser'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    visit '/sessions/new'
    fill_in(:email, with: 'test_email@not_real.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, @testuser'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'sign out is only possible if user has signed in' do
    visit "/peeps"
    expect{ page.find_button('Sign out') }.to raise_error(Capybara::ElementNotFound)
  end

  scenario 'a user can sign out' do
      # Sign in as user
    visit '/sessions/new'
    fill_in(:email, with: 'test_email@not_real.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # Sign out
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, @testuser'
    expect(page).to have_content 'You have signed out.'
  end
end
