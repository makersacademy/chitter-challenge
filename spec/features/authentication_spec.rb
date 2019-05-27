feature 'authentication' do
  scenario 'users can sign in' do
    User.sign_up(email: 'a@a.com', password: '123', name: 'test user',
                 username: 'test_user')

    visit '/peeps'
    click_button('Log in')
    sign_in
    expect(page).to have_content('Welcome, test user')
  end

  scenario 'users see a prompt if their email is incorrect' do
    visit '/login/new'
    sign_in
    expect(page).to have_content('Your email or password is incorrect')
  end

  scenario 'users see a prompt if their password if incorrect' do
    User.sign_up(email: 'a@a.com', password: '123', name: 'test user',
                 username: 'test_user')

    visit '/login/new'
    fill_in('email', with: 'a@a.com')
    fill_in('password', with: '1234')
    click_button('Sign in')
    expect(page).to have_content('Your email or password is incorrect')
  end

  scenario 'users are able to sign out' do
    User.sign_up(email: 'a@a.com', password: '123', name: 'test user',
                 username: 'test_user')

    visit '/login/new'
    sign_in
    click_button 'Log out'
    expect(page).to have_content('You have logged out')
    expect(page).not_to have_content('Welcome, test user')
  end
end
