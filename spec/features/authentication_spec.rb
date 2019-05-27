feature 'authentication' do
  scenario 'users can sign in' do
    User.sign_up(email: 'a@a.com', password: '123', name: 'test user',
                 username: 'test_user')

    visit '/peeps'
    click_button('Log in')
    fill_in('email', with: 'a@a.com')
    fill_in('password', with: '123')
    click_button('Sign in')
    expect(page).to have_content('Welcome, test user')
  end

  scenario 'users see an error if their email is incorrect' do
    visit '/login/new'
    fill_in('email', with: 'a@a.com')
    fill_in('password', with: '123')
    click_button('Sign in')
    expect(page).to have_content('Your email or password is incorrect')
  end
end
