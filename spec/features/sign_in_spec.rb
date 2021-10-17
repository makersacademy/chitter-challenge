feature 'Signing IN' do
  scenario 'user can sign in' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')

    # Then sign in as them
    visit '/users/sign_in'
    fill_in('username', with: 'test_user')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, test_user'
  end

  scenario 'user sees an error if they get their username wrong' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')

    visit '/users/sign_in'
    fill_in(:username, with: 'test_aasuser')
    fill_in(:password, with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome, test_user'
    expect(page).to have_text('Please check your username or password.', normalize_ws: true)
  end

  scenario 'user sees an error if they get their password wrong' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')

    visit '/users/sign_in'
    fill_in(:username, with: 'test_user')
    fill_in(:password, with: 'passwo23')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome, test_user'
    expect(page).to have_text('Please check your username or password.', normalize_ws: true)
  end
end
