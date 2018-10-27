feature 'Post Peeps' do
  scenario 'user fills in signup form and clicks signup' do
    visit('/')
    fill_in 'name', with: "RaySmith"
    fill_in 'email', with: "smith.raylene@gmail.com"
    fill_in 'username', with: "Ray"
    fill_in 'password', with: "password123"
    click_button 'Sign Up'
    click_button 'Start Peeping!'
    fill_in 'peep', with: "Spent my day coding!"
    click_button 'Peep'
    expect(page).to have_content("Spent my day coding!")
  end
end
