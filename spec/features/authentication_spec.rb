feature 'Authentication' do
  scenario 'User can sign in' do
    User.create(email: 'test@example.com',
      password: 'password', name: 'test', username: 'test123')
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password')
    click_button 'Sign in'
    expect(page).to have_content 'Welcome, test123'
  end
end
feature 'Authentication' do
  scenario 'User gets error if they put the wrong email' do
    User.create(email: 'test@example.com',
      password: 'password', name: 'test', username: 'test123')
    visit '/sessions/new'
    fill_in('email', with: 'wrongemail@example.com')
    fill_in(:password, with: 'password')
    click_button 'Sign in'
    expect(page).to have_content 'Please check your email or password.'
  end
end
