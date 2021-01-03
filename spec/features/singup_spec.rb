feature "Sign up" do
  scenario "user can create an account" do
    visit "/"
    click_link "Sign up"
    expect(page).to have_content "Sign Up"
  end
  scenario "user can see a Login link" do
    visit "/signup"
    find_link("Login").visible?
    expect(page).to have_link("Login", href: "login")
  end
  scenario "user can see a Home link" do
    visit "/signup"
    find_link("Home").visible?
    expect(page).to have_link("Home", href: "/")
  end
  scenario "user can enter its username" do
    visit "/signup"
    within("form") { find('input[name="username"]').visible? }
  end
  scenario "user can enter its first name" do
    visit "/signup"
    within("form") { find('input[name="name"]').visible? }
  end
  scenario "user can enter its last name" do
    visit "/signup"
    within("form") { find('input[name="lastname"]').visible? }
  end
  scenario "user can enter its email" do
    visit "/signup"
    within("form") { find('input[name="email"]').visible? }
  end
  scenario "user can enter its password" do
    visit "/signup"
    within("form") { find('input[name="password"]').visible? }
  end
  scenario "click register button" do
    visit "/signup"
    within("form") { find_button("Register").visible? }
  end
  scenario "a user can sign up" do
    visit "/signup"
    fill_in("username", with: "admin2")
    fill_in("name", with: "admin2")
    fill_in("lastname", with: "admin2")
    fill_in("email", with: "admin@example.com")
    fill_in("password", with: "password123")
    click_button("Register")
    expect(page).to have_content("Account successfully created, please login with you new details")
  end
  scenario "a user cannot sign up with a username or email already registered" do
    visit "/signup"
    fill_in("username", with: "admin")
    fill_in("name", with: "Admin")
    fill_in("lastname", with: "Admin")
    fill_in("email", with: "admin@admin.com")
    fill_in("password", with: "Admin")
    click_button("Register")
    expect(page).to have_content("User or email already taken")
  end
end
