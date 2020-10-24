feature 'Log out' do
  scenario 'a user can sign out of their account' do
    User.create(email: 'test@testing.com', password: 'password123')

    visit '/'
    click_on('Sign In')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    click_button('Sign Out')

    expect(page).not_to have_content("Welcome, test@testing.com")
    expect(page).to have_content 'Goodbye!'
  end
end
