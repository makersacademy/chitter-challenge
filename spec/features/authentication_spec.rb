feature 'authentication' do
  scenario 'a user can sign in' do
    user = User.create(username: 'test456', name: 'test guy', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'test456')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test456'
  end
  scenario 'a user sees an error if they get their email wrong' do
    User.create(username: 'test456', name: 'test guy', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'nottherighttestguy')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, testguy'
    expect(page).to have_content 'Please check your username or password.'
  end
  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'testerguy', name: 'test guy', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'testerguy')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, testerguy'
    expect(page).to have_content 'Please check your username or password.'
  end
  scenario 'a user can sign out' do
    User.create(username: 'testerguy', name: 'test guy', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'testerguy')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, testerguy'
    expect(page).to have_content 'You have signed out.'
  end
end