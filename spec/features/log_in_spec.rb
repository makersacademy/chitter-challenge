feature 'Log In' do
  scenario 'user logs in with valid credentials' do
    visit('/')
    fill_in 'name', with: "RaySmith"
    fill_in 'email', with: "smith.raylene@gmail.com"
    fill_in 'username', with: "Ray"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    visit('/')
    fill_in 'existing_email', with: "smith.raylene@gmail.com"
    fill_in 'existing_password', with: "password123"
    click_button 'Log In'
    expect(page).to have_content "Welcome Ray"
  end

  scenario 'user logs in with invalid email' do
    visit('/')
    fill_in 'name', with: "RaySmith"
    fill_in 'email', with: "smith.raylene@gmail.com"
    fill_in 'username', with: "Ray"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    visit('/')
    fill_in 'existing_email', with: "wrong_email@gmail.com"
    fill_in 'existing_password', with: "password123"
    click_button 'Log In'
    expect(page).to have_content 'Error: The email you have entered is not in our system'
  end

end
