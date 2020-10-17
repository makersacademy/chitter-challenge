feature 'user sign up' do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }
  let(:username2) { 'tester2' }
  let(:email2) { 'email2' }

  scenario 'a new user signs up with valid details' do
    visit '/chitter'
    click_button 'Sign Up'
    expect(current_path).to eq '/chitter/user/new'
    fill_in 'username', with: username
    fill_in 'name', with: user
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign Up'
    expect(current_path).to eq '/chitter'
    expect(page).to have_content "Hello #{username}"
    expect(page).not_to have_button "Sign Up"
  end

  scenario 'a new user signs up with duplicate username' do
    DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{user}','#{username}','#{email}','#{password}')")
    visit '/chitter'
    sign_up(name: user, username: username, email: email2, password: password)
    expect(current_path).to eq '/chitter/user/new'
    expect(page).to have_content 'That username is already in use.'
    expect(page).to have_button 'Sign Up'
  end

  scenario 'a new user signs up with duplicate email' do
    DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{user}','#{username}','#{email}','#{password}')")
    visit '/chitter'
    sign_up(name: user, username: username2, email: email, password: password)
    expect(current_path).to eq '/chitter/user/new'
    expect(page).to have_content 'That email address is already in use.'
    expect(page).to have_button 'Sign Up'
  end
end
