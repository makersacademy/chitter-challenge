feature "5. So that only I can post messages on Chitter as me," do
  feature "I want to log in to Chitter," do
    scenario "Happy path: user has correct credentials" do
      User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")

      visit "/"
      click_button("Log in")
      fill_in("email", with: "test@example.com")
      fill_in("password", with: "password123")
      click_button("Submit")
      expect(page).to have_content("User 1")
    end

    scenario "Unhappy path 1: user has incorrect email" do
      User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")

      visit "/"
      click_button("Log in")
      fill_in("email", with: "wrong@email.com")
      fill_in("password", with: "password123")
      click_button("Submit")
      expect(page).to have_content("Incorrect email or password")
    end

    scenario "Unhappy path 2: user has incorrect password" do
      User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")

      visit "/"
      click_button("Log in")
      fill_in("email", with: "test@example.com")
      fill_in("password", with: "wrongpassword")
      click_button("Submit")
      expect(page).to have_content("Incorrect email or password")
    end
  end
end
