feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', name: 'John Smith', username: 'test_user22')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test_user22'
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(email: 'test1@example.com', password: 'password123', name: 'Jim Smith', username: 'test_user23')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content "Welcome, test_user23"
    expect(page).to have_content 'Please check your email or password'
  end

  it 'a user sees an error if they get their password wrong' do
    User.create(email: 'test2@example.com', password: 'password123', name: 'Jim Smith', username: 'test_user24')

    visit '/sessions/new'
    fill_in(:email, with: 'test2@example.com')
    fill_in(:password, with: 'password_1')
    click_button('Sign in')

    expect(page).not_to have_content "Welcome, test_user24"
    expect(page).to have_content 'Please check your email or password'
  end

  it 'a user can sign out' do
    User.create(email: 'test5@example.com', password: 'password123', name: 'Paul Smith', username: 'test_user25')

    visit '/sessions/new'
    fill_in(:email, with: 'test5@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test_user25'
    expect(page).to have_content "You have signed out"
  end
end
