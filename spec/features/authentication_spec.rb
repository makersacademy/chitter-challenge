feature 'authentication' do
  scenario 'a user can sign in' do
    user = User.create(
      name: "User's Name",
      email: 'user@user.com',
      username: 'user1',
      password: 'user123'
    )
    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'user123'
    click_button 'Sign In'

    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'a user enters incorrect username' do
    User.create(
      name: "User's Name",
      email: 'user@user.com',
      username: 'user1',
      password: 'user123'
    )
    visit '/sessions/new'
    fill_in 'username', with: 'incorrectusername'
    fill_in 'password', with: 'user123'
    click_button 'Sign In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect."
  end

  scenario 'a user enters incorrect password' do
    user = User.create(
      name: "User's Name",
      email: 'user@user.com',
      username: 'user1',
      password: 'user123'
    )
    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'wrong_password'
    click_button 'Sign In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect."
  end

  scenario 'a user can sign out' do
    user = User.create(
      name: "User's Name",
      email: 'user@user.com',
      username: 'user1',
      password: 'user123'
    )
    visit '/sessions/new'
    fill_in 'username', with: user.username
    fill_in 'password', with: 'user123'
    click_button 'Sign In'

    click_button 'Sign Out'

    expect(page).not_to have_content "Welcome #{user.name}"
    expect(page).to have_content 'You have signed out'
  end
end
