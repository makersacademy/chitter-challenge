feature 'authentication' do
  test_user = {
    name: "User's Name",
    email: 'user@user.com',
    username: 'user1',
    password: 'user123'
  }
  scenario 'a user can sign in' do
    user = User.create(test_user)

    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'user123'
    click_button 'Sign In'

    expect(page).to have_content "Welcome back, #{user.name}"
  end

  scenario 'a user enters incorrect username' do
    User.create(test_user)

    visit '/sessions/new'
    fill_in 'username', with: 'incorrectusername'
    fill_in 'password', with: 'user123'
    click_button 'Sign In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect."
  end

  scenario 'a user enters incorrect password' do
    user = User.create(test_user)

    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'wrong_password'
    click_button 'Sign In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect."
  end

  scenario 'a user can sign out' do
    user = User.create(test_user)

    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'user123'
    click_button 'Sign In'

    click_button 'Sign Out'

    expect(page).not_to have_content "Welcome back, #{user.name}"
    expect(page).to have_content 'You have signed out'
  end
end
