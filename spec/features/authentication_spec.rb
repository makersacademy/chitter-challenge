feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(name: 'John Bob', username: 'johnbob', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'johnbob')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(page).to have_content 'Welcome, John Bob'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: 'John Bob', username: 'johnbob', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'wrongguy')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, John Bob'
    expect(page).to have_content 'Username or password is invalid'
  end

  scenario 'a user can sign out' do
    User.create(name: 'John Bob', username: 'johnbob', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'johnbob')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    click_button('Log out')

    expect(page).not_to have_content 'Welcome, John Bob!'
    expect(page).to have_content 'You have signed out.'
  end
end