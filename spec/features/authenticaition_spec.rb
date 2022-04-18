feature 'authentication' do
  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'Test123', name: 'Test', username: 'testing')

    visit '/'
    fill_in('email', with: 'incorrectemail@gmail.com')
    fill_in('password', with: 'test123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome to Chitter Test'
    expect(page).to have_content 'Please check your email or password'
  end
  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'Test123', name: 'Test', username: 'testing')

    visit '/'
    fill_in('email', with: 'incorrectemail@gmail.com')
    fill_in('password', with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome to Chitter Test'
    expect(page).to have_content 'Please check your email or password'
  end
  scenario 'it allows a user to sign out' do
    User.create(email: 'test@example.com', password: 'Test123', name: 'Test', username: 'testing')

    visit('/')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'Test123')
    click_button('Sign in')

    click_button('Sign out')
    expect(page).not_to have_content 'Welcome to Chitter Test'
    expect(page).to have_content 'You have signed out'
  end
end
