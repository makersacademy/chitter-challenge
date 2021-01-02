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

    click_link 'Return to Peeps'

    expect(page).to have_content "Welcome back, Little Miss User"
  end

  scenario 'email must be unique' do
    create_users

    visit '/users/new'

    fill_in 'user[name]', with: 'New User'
    fill_in 'user[email]', with: 'testuser2@email.com' # already used
    fill_in 'user[username]', with: 'new_user'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign Up'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'That email address is already registered.'
  end

  scenario 'username must be unique' do
    create_users

    visit '/users/new'

    fill_in 'user[name]', with: 'New User'
    fill_in 'user[email]', with: 'new@user.com'
    fill_in 'user[username]', with: 'Test_username2' # already used
    fill_in 'user[password]', with: 'password'
    click_button 'Sign Up'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'That username is already taken!'
  end

  scenario 'password is encrypted' do
    create_users

    user = User.all.first

    expect(user.password).not_to eq 'password'
  end

end
