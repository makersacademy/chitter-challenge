feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123')

    # Then sign in as them
    visit '/users/sign_in'
    fill_in('username', with: 'test_user')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, test_user'
  end

  scenario 'a user sees an error if they get their username wrong' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123')

    visit '/users/sign_in'
    fill_in(:username, with: 'test_aasuser')
    fill_in(:password, with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome, test_user'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123')

    visit '/users/sign_in'
    fill_in(:username, with: 'test_user')
    fill_in(:password, with: 'passwo23')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome, test_user'
    expect(page).to have_content 'Please check your email or password.'
  end
end