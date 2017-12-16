feature "signing up" do
  scenario "the user should see a welcome message when they sign up" do
    sign_up
    expect(page).to have_content "Welcome Tester"
  end
  scenario "the user should have to enter an email" do
    sign_up(email: "")
    expect(page).to have_content "Email must not be blank"
  end
  scenario "the email address should be of the correct format" do
    sign_up(email: " dfgdfg")
    expect(page).to have_content "Email has an invalid format"
  end
  scenario "the same email address cannot sign up twice" do
    sign_up
    sign_up
    expect(page).to have_content "Email address already in use"
  end
  scenario "the user should have to enter a password" do
    sign_up(password: "")
    expect(page).to have_content "Password must not be blank"
  end
  scenario "the password confirmation should match the password" do
    sign_up(password_confirm: "bloopers")
    expect(page).to have_content "Password does not match the confirmation"
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
feature "logging out" do
  scenario "the user should be redirected to the homepage when they sign out" do
    sign_up
    sign_in
    visit '/sign_out'
    expect(page).to have_content "Please sign in or sign up!"
  end
end
