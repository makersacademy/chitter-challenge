feature 'authentication' do
  scenario 'A Chitter member can log in' do
    Member.create(
      name: 'Test Person',
      username: 'test123',
      email: 'test@example.com',
      password: 'password123')

    visit('sessions/new')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).to have_content 'Welcome to Chitter, Test Person'
  end

  scenario 'A member sees an error if they get their email wrong' do
    Member.create(
      name: 'Test Person',
      username: 'test123',
      email: 'test@example.com',
      password: 'password123')

    visit('sessions/new')
    fill_in(:email, with: 'incorrecttest@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome to Chitter, Test Person'
    expect(page).to have_content 'Please check your email or password'
  end
end
