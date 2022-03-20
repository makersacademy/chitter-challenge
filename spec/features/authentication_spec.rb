feature 'authentication' do
  scenario 'a user can sign in' do
    user_login
    expect(page).to have_content 'Welcome to Chitter, Valentina!'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')

    visit '/sessions/new'
    fill_in('email', with: 'notmyemail@wrongemail.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome to Chitter, Valentina!'
    expect(page).to have_content 'Incorrect email or password! Please check your details.'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome to Chitter, Valentina!'
    expect(page).to have_content 'Incorrect email or password! Please check your details.'
  end

  scenario 'a user can sign out' do
    user_login

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome to Chitter, Valentina!'
    expect(page).to have_content 'See you soon!'
  end
end
