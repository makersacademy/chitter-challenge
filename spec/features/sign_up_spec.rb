feature 'Sign Up Page' do
  scenario 'allows a new user to sign up' do
    visit('/')
    click_on('Sign Up')
    email = "samm@makersacademy.com"
    password = "password123"
    name = "Sam Morgan"
    username = "sjmog"
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'name', with: name
    fill_in 'username', with: username
    click_button('Confirm')
    expect(page).to have_content("Welcome #{name}")
    expect(page).to have_content("Your Username is #{username}")
  end
end
