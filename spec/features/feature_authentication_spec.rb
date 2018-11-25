feature 'Authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
    visit '/sessions/session_new'
    fill_in :username, with: 'zorro'
    fill_in :password, with: 'password123'
    click_button('Sign in')
    expect(page).to have_content 'Welcome on Chitter, zorro!'
  end

  scenario 'a user sees an error if they get their username wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
    visit '/sessions/session_new'
    fill_in(:username, with: 'nottherightusername')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome on Chitter, zorro!'
    expect(page).to have_content 'Please check your username or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
    visit '/sessions/session_new'
    fill_in(:username, with: 'zorro')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome on Chitter, zorro!'
    expect(page).to have_content 'Please check your username or password.'
  end

  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
    visit '/sessions/session_new'
    fill_in(:username, with: 'zorro')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome on Chitter, zorro!'
    expect(page).to have_content 'You have signed out.'
  end

end
