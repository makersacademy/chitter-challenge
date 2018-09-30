feature "Sing In Page"do
  scenario "has sign in button that takes you to Users page" do
    User.create(email: "test@email.com", password: "password12345", username: "Jim33", name: "Jim Smith")
    visit "/users/sign_in"
    fill_in("username", with: "Jim33")
    fill_in("password", with: "password12345")
    click_button "Sign In"
    expect(page).to have_content("Welcome, Jim Smith")
  end

  scenario "rejects unknown usernames" do
    visit "/users/sign_in"
    fill_in("username", with: "Jim33")
    fill_in("password", with: "password12345")
    click_button "Sign In"
    expect(page).to have_content("Sorry, either your username or password were incorrect")
  end

  scenario "rejects unknown usernames" do
    User.create(email: "test@email.com", password: "password12345", username: "Jim33", name: "Jim Smith")
    visit "/users/sign_in"
    fill_in("username", with: "Jim33")
    fill_in("password", with: "password")
    click_button "Sign In"
    expect(page).to have_content("Sorry, either your username or password were incorrect")
  end
end
