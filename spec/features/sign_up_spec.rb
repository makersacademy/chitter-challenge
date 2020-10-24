feature 'user registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_on('Sign up')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content("Congratulations, test@testing.com! You've successfully signed up to Chitter!")
  end
end
