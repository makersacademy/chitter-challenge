feature 'Registration' do
  scenario 'User can sign up' do
    visit '/users/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'test123'
    fill_in :name, with: 'Tester Test'
    fill_in :username, with: 'TTest'
    click_button('Submit')
    expect(page).to have_content("Welcome, TTest!")
  end

  scenario 'User can not sign up if email already used' do
    User.create(
      email: 'test@example.com',
      password: 'test123',
      name: 'Tester Test',
      username: 'TTest'
    )
    visit '/users/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: '123test'
    fill_in :name, with: 'Test Tester'
    fill_in :username, with: 'TTester'
    click_button('Submit')
    expect(page).to have_content("Email already in use")
  end

  scenario 'User can not sign up if username already used' do
    User.create(
      email: 'test@example.com',
      password: 'test123',
      name: 'Tester Test',
      username: 'TTest'
    )
    visit '/users/new'
    fill_in :email, with: 'tester@example.com'
    fill_in :password, with: '123test'
    fill_in :name, with: 'Test Tester'
    fill_in :username, with: 'TTest'
    click_button('Submit')
    expect(page).to have_content("Username already in use")
  end

end
