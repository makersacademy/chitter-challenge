feature 'user registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_on('Sign up')
    fill_in('name', with: 'Barry')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content("Welcome, test@testing.com")
  end
end
