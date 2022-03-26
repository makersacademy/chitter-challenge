feature 'Authentication' do
  scenario 'user can sign in' do
    User.create(
      name: 'samuel', 
      username: 'samuelmbp', 
      email: 'sam@example.com', 
      password: 'test1234'
    )

    visit 'sessions/new'
    fill_in 'email', with: 'samuel@example.com'
    fill_in 'password', with: 'test1234'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome samuel@example.com'
  end
end