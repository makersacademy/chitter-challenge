feature 'Sign in' do

  scenario 'An existing user can sign in with the correct email and password' do
    email = 'test@example.com'
    password = 'pass123'
    name = 'Melvin Lau'
    username = 'melvinlau'

    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )

    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Sign In'
    end
    expect(page).to have_content "#{name}"
  end

  # To test for unhappy paths

end
