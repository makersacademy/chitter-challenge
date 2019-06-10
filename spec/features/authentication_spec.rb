feature 'authentication' do
  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: 'Test', username: 'test', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(name: 'Test', username: 'test', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    User.create(name: 'Test', username: 'test', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    click_button('Log out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end