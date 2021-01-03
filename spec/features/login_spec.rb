feature "Login" do
  scenario "user can click login" do
    visit "/"
    click_link("Login")
    within("form") { expect(page).to have_content("Login") }
  end
  scenario "user can see a link to home page" do
    visit "/login"
    find_link("Home").visible?
    expect(page).to have_link("Home", href: "/")
  end
  scenario "user can see a link to sing up" do
    visit "/login"
    find_link("Sign up").visible?
    expect(page).to have_link("Sign up", href: "signup")
  end
  scenario "user can see a link to sing up" do
    visit "/login"
    find_link("Sign up").visible?
    expect(page).to have_link("Sign up", href: "signup")
  end
  scenario "user can enter its email" do
    visit "/login"
    find('input[name="email"]').visible?
  end
  scenario "user can enter its password" do
    visit "/login"
    find('input[name="password"]').visible?
  end
  scenario "click enter button" do
    visit "/login"
    within("form") { find_button("Enter").visible? }
  end
end
