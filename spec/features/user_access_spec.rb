feature "signing up" do
  scenario "the user should see a welcome message when they sign up" do
    sign_up
    expect(page).to have_content "Welcome Tester"
  end
  scenario "the user should have to enter an email" do
    sign_up(email: "")
    expect(page).to have_content "Email must not be blank"
  end
  scenario "the user should have to enter a password" do
    sign_up(password: "")
    expect(page).to have_content "Password must not be blank"
  end
end

feature "logging in" do
  scenario "the user should see a welcome message when they log in" do
    sign_up
    sign_in
    expect(page).to have_content "Welcome Tester"
  end
  scenario "the user should have to enter the correct password to log in" do
    sign_up
    sign_in(password: "")
    expect(page).to have_content "Login failed. Please check your username and password."
  end
end
