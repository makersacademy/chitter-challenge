feature "User can log in to the site" do
  let(:user) {User.create}
  scenario "verifies user has registered before allowing access" do
    visit '/login'
    fill_in 'email', with: "jobloggs@test.com"
    fill_in 'password', with: "P455w0rd"
    click_button 'login'
    expect(page).to have_content("Login Successful")
  end
end
