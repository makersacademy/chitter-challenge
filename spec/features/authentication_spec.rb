feature 'Sign in' do
  scenario 'both email and password are correct' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')

    visit '/sessions/new'
    fill_in('username', with: 'ricky_m')
    fill_in('password', with: 'password123')
    click_on('Submit')

    expect(page).to have_content "Hello ricky_m"
  end

  scenario 'username incorrect' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')

    visit '/sessions/new'
    fill_in('username', with: 'wrongRicky')
    fill_in('password', with: 'password123')
    click_on('Submit')

    expect(page).not_to have_content "Hello ricky_m"
    expect(page).to have_content "Your username or password is incorrect."
  end

  scenario 'password incorrect' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')

    visit '/sessions/new'
    fill_in('username', with: 'ricky_m')
    fill_in('password', with: 'wrongPassword')
    click_on('Submit')

    expect(page).not_to have_content "Hello ricky_m"
    expect(page).to have_content "Your username or password is incorrect."
  end

  scenario 'user can sign out' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')

    visit '/sessions/new'
    fill_in('username', with: 'ricky_m')
    fill_in('password', with: 'password123')
    click_on('Submit')
    click_on('Sign out')

    expect(page).to have_content "You have signed out."
  end
end
