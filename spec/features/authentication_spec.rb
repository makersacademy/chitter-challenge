feature 'authentication' do
  it 'a user can sign in' do
    User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')
    expect(page).to have_content 'Welcome Tester'
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')
    expect(page).not_to have_content 'Welcome Tester'
    expect(page).to have_content 'Please check your email or password.'
  end
end
