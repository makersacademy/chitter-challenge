feature 'authentication' do
  it 'a user can sign in' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', username: 'riya', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome Riya Dattani'
  end
end
