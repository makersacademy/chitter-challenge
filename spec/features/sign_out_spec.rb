feature 'Sign Oout' do
  scenario 'a user can sign out' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123')
    visit '/users/sign_in'
    fill_in(:username, with: 'test_user')
    fill_in(:password, with: 'password123')
    click_button('Submit')

    # Sign out
    click_button('Sign Out')

    expect(page).not_to have_content 'Welcome, test_user'
  end
end