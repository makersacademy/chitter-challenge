feature "User login" do
  scenario "existing user cannot log in with incorrect password" do
    create_user
    log_in
    expect(page).to_not have_content("Welcome back, Van")
    expect(current_path).to eq("/user/login")
  end

  scenario "non-existant user cannot log in" do
    visit("/user/login")
    fill_in(:username, with: "vannio")
    fill_in(:password, with: "password123")
    click_button(:"Log In")
    expect(page).to_not have_content("Welcome back, Van")
    expect(current_path).to eq("/user/login")
  end
end

feature "User logout" do
  scenario "existing user can log out once logged in" do
    create_user
    log_in
    visit("/user/logout")
    click_button(:"Log Out")
    expect(page).to have_content("Successfully logged out")
  end
end
