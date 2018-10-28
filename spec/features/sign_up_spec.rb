feature 'Sign Up' do
  scenario 'user fills in signup form and clicks signup' do
    visit('/')
    fill_in 'name', with: "RaySmith"
    fill_in 'email', with: "smith.raylene.88@gmail.com"
    fill_in 'username', with: "Ray88"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    expect(page).to have_content "Welcome Ray"
  end
end
