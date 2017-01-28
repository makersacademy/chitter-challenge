feature "FEATURE: Signing In" do
  let!(:user) { User.create(email: "test@test.com",
    password: "password", password_confirmation: "password",
    name: "Test Test", username: "test") }

    scenario "can sign in with correct email and password" do
    sign_in(username: user.username, password: user.password)
    expect(page.current_path).to eq "/peeps"
    expect(page).to have_content "Welcome, #{user.username}"
  end

end
