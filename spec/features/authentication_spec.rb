feature 'authentication' do
  scenario 'a user can sign in' do

    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Conor',
      username: 'Thor'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Thor'
  end

  scenario 'a user cannot sign in with the wrong email' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Conor',
      username: 'Thor'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'Makers@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, Thor'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user cannot sign in with the wrong password' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Conor',
      username: 'Thor'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'pass')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, Thor'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      name: 'Conor',
      username: 'Thor'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, Thor'
    expect(page).to have_content 'You have signed out'
  end
end
  