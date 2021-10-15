feature 'authentication' do
  it 'a user can sign in' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123')

    # Then sign in as them
    visit '/users/sign_in'
    fill_in('username', with: 'test_user')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, test_user'
  end
end