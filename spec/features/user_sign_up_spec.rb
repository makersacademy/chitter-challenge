feature 'user signs up for Chitter' do
  scenario 'user can register with email, password, name and username' do
    visit '/'
    click_link 'Sign Up'

    expect(current_path).to eq '/users/new'

    fill_in 'user[name]', with: 'Little Miss User'
    fill_in 'user[email]', with: 'LMU@testuser.com'
    fill_in 'user[username]', with: 'little_miss_user'
    fill_in 'user[password]', with: 'LMU_password'
    click_button 'Sign Up'

    user = User.find_by(name: 'Little Miss User')

    expect(current_path).to eq "/users/#{user.id}/welcome"
    expect(page).to have_content "Welcome, #{user.name}"
    expect(page).to have_content user.email
    expect(page).to have_content user.username
    expect(page).to have_content user.password
  end

  scenario 'email must be unique' do
    User.create(
      name: 'User 1',
      email: 'user@repeat.com',
      username: 'user_1',
      password: 'user123'
    )
    visit '/users/new'

    fill_in 'user[name]', with: 'User 2'
    fill_in 'user[email]', with: 'user@repeat.com'
    fill_in 'user[username]', with: 'user_2'
    fill_in 'user[password]', with: 'user123'
    click_button 'Sign Up'

    expect(page).to have_content 'That email address is already registered.'
  end

  scenario 'username must be unique' do
    User.create(
      name: 'User 1',
      email: 'user1@user.com',
      username: 'userrepeat',
      password: 'user123'
    )
    visit '/users/new'

    fill_in 'user[name]', with: 'User 2'
    fill_in 'user[email]', with: 'user2@user.com'
    fill_in 'user[username]', with: 'userrepeat'
    fill_in 'user[password]', with: 'user123'
    click_button 'Sign Up'

    expect(page).to have_content 'That username is already taken!'
  end

  scenario 'password is encrypted' do
    visit '/'
    click_link 'Sign Up'

    fill_in 'user[name]', with: 'Little Miss User'
    fill_in 'user[email]', with: 'LMU@testuser.com'
    fill_in 'user[username]', with: 'little_miss_user'
    fill_in 'user[password]', with: 'LMU_password'
    click_button 'Sign Up'

    user = User.find_by(name: 'Little Miss User')

    expect(user.password).not_to eq 'LMU_password'
  end

end
