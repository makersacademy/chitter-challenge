feature "User login" do
  scenario "existing user cannot log in with incorrect password" do
    User.create(
      username: "vannio",
      name: "Van",
      email: "van@email.com",
      password: "password123",
      password_confirm: "password123"
    )

    visit("/user/login")
    fill_in(:username, with: "vannio")
    fill_in(:password, with: "password321")
    click_button(:"Log In")
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
    User.create(
      username: "vannio",
      name: "Van",
      email: "van@email.com",
      password: "password123",
      password_confirm: "password123"
    )

    visit("/user/login")
    fill_in(:username, with: "vannio")
    fill_in(:password, with: "password321")
    click_button(:"Log In")
    visit("/user/logout")
    click_button(:"Log Out")
    expect(page).to have_content("Successfully logged out")
  end
end
