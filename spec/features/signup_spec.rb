feature 'User signup' do
  scenario 'User signs up with correct credentials' do
    signup
    expect(page).to have_content("Hey, Bob!")
  end

  scenario 'User can\'t sign up with invalid email' do
    signup(email: 'email@email')
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'User doesn\'t enter an email address' do
    signup(email: '')
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'User doesn\'t enter a display name' do
    signup(display_name: '')
    expect(page).to have_content("Display name must not be blank")
  end

  scenario 'User doesn\'t enter a username' do
    signup(username: '')
    expect(page).to have_content("Username must not be blank")
  end

  scenario 'User doesn\'t enter a password' do
    signup(password: nil)
    expect(page).to have_content("Password must not be blank")
  end
end
