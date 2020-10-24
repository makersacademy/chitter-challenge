feature 'Log in' do
  scenario 'a user can sign into their account with the correct details' do
    User.create(email: 'test@testing.com', password: 'password123')

    visit '/'
    click_on('Sign In')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content("Welcome, test@testing.com")
  end
end
