feature "User can log in to the site" do
  scenario "verifies user has registered before allowing access" do
    register_user
    visit '/login'
    fill_in 'email', with: "jobloggs@test.com"
    fill_in 'password', with: "P455w0rd"
    click_button 'login'
    expect(page).to have_content("Login successful")
  end
end
