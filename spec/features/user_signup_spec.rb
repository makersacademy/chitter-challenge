feature 'User Sign Up' do
  scenario 'A user is created' do
    sign_up_correctly
    expect(User.count).to eq 1
  end

  scenario 'No user created if password not confirmed' do
    sign_up_incorrect_password
    expect(User.count).to eq 0
  end

  scenario 'Informs user if passwords do not match' do
    sign_up_incorrect_password
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Passwords did not match.')
  end

  scenario 'Must sign up with valid email' do
    sign_up_correctly(email: nil)
    expect(User.count).to eq 0
  end

  scenario 'Must sign up with unique email' do
    sign_up_correctly
    click_button("Sign Out")
    sign_up_correctly(username: "SomeGuy")
    expect(User.count).to eq 1
  end

  scenario 'Must sign up with unique username' do
    sign_up_correctly
    click_button("Sign Out")
    sign_up_correctly(email: "p@p.com")
    expect(User.count).to eq 1
  end

end
