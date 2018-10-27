feature 'Sign Up' do
  scenario 'user fills in signup form and clicks signup' do
    visit('/')
    fill_in 'name', with: "Ray"
    fill_in 'email', with: "smith.raylene@gmail.com"
    fill_in 'username', with: "RayRay"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    expect(page).to have_content "Welcome RayRay"
  end
end
