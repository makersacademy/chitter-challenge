feature "User login" do
  scenario "existing user cannot log in with incorrect password" do
    create_user
    visit("/sessions/new")
    fill_in(:username, with: "vannio")
    fill_in(:password, with: "wrong_password")
    click_button(:"Log In")
    expect(current_path).to eq("/sessions/new")
    expect(page).to have_content("Username or password combination incorrect")
  end

  scenario "non-existent user cannot log in" do
    log_in
    expect(current_path).to eq("/sessions/new")
    expect(page).to have_content("Username or password combination incorrect")
  end
end

feature "User logout" do
  scenario "existing user can log out once logged in" do
    create_user
    log_in
    visit("/")
    click_button(:"Log Out")
    expect(page).to have_content("Successfully logged out")
  end
end
