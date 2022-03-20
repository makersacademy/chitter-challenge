feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Bob Marley', username: 'bmarley')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Bob Marley!'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Bob Marley', username: 'bmarley')
  
    visit '/sessions/new'
    fill_in('email', with: 'nottherightemail@me.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
  
    expect(page).not_to have_content 'Welcome, Bob Marley!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Bob Marley', username: 'bmarley')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, Bob Marley!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Bob Marley', username: 'bmarley')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, Bob Marley!'
    expect(page).to have_content 'You have signed out.'
  end
end
