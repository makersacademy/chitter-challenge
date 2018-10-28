feature 'Sign Up' do
  scenario 'user fills in signup form and clicks signup' do
    visit('/')
    fill_in 'name', with: "RaySmith"
    fill_in 'email', with: "smith.raylene@gmail.com"
    fill_in 'username', with: "Ray"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    expect(page).to have_content "Welcome Ray"
  end
end

feature 'Log In' do
  scenario 'user fills in log in form and clicks signup' do
    visit('/')
    fill_in 'name', with: "RaySmith"
    fill_in 'email', with: "smith.raylene@gmail.com"
    fill_in 'username', with: "Ray"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    visit('/')
    fill_in 'existing_username', with: "Ray"
    fill_in 'existing_password', with: "password123"
    click_button 'Log In'
    expect(page).to have_content "Welcome Ray"
  end
end
