feature 'registration' do
  scenario 'a user can sign up' do
    sign_up

    click_button('Sign in')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log In')

    expect(page).to have_content 'Welcome, testname'
  end

end
