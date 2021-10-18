feature 'Signing OUT' do
  scenario 'a user can sign out' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password', name: 'test name')
    visit '/'
    click_button 'Sign In'
    fill_in(:username, with: 'test_user')
    fill_in(:password, with: 'password')
    click_button('Submit')
    click_button('Sign Out')

    expect(page).not_to have_selector(:link_or_button, 'Sign Out')
  end
end
