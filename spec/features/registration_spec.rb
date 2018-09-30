feature "registration" do
  scenario "a user can sign up" do
    visit "/users/new"
    fill_in("email", with: "test@email.com")
    fill_in("password", with: "password12345")
    fill_in("username", with: "AbagnaleF")
    fill_in("name", with: "Frank Abagnale")
    click_button "Sign Up"

    expect(page).to have_content("Welcome, Frank Abagnale")
  end

  scenario "email must be unique" do
    visit "/users/new"
    fill_in("email", with: "test@email.com")
    fill_in("password", with: "password12345")
    fill_in("username", with: "AbagnaleF")
    fill_in("name", with: "Frank Abagnale")
    click_button "Sign Up"

    expect(page).to have_content("Welcome, Frank Abagnale")

    visit "/users/new"
    fill_in("email", with: "test@email.com")
    fill_in("password", with: "password098876")
    fill_in("username", with: "FunkMaster")
    fill_in("name", with: "Funk Abagnale")
    click_button "Sign Up"
    expect(page).to have_content("Sorry, that email or username has already been used.")
  end

  scenario "username must be unique" do
    visit "/users/new"
    fill_in("email", with: "test@email.com")
    fill_in("password", with: "password12345")
    fill_in("username", with: "AbagnaleF")
    fill_in("name", with: "Frank Abagnale")
    click_button "Sign Up"

    expect(page).to have_content("Welcome, Frank Abagnale")

    visit "/users/new"
    fill_in("email", with: "different@email.com")
    fill_in("password", with: "password098876")
    fill_in("username", with: "AbagnaleF")
    fill_in("name", with: "Funk Abagnale")
    click_button "Sign Up"
    expect(page).to have_content("Sorry, that email or username has already been used.")
  end
end
