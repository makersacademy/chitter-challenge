feature "New user registers" do
  scenario "correct details and is welcomed" do
    sign_up_details()
    expect(page.status_code).to be(200)
    expect(page).to have_content("Welcome Mad Hare! You are now registered on Chitter.")
  end
end

feature "Registered user logs in" do
  scenario "using correct details" do
    log_in_details()
    expect(page.status_code).to be(200)
    expect(page).to have_content("Welcome Mad Hare!")
  end
end

feature "Logged in user can log out" do
  scenario "user logs out" do
    log_in_details()
    click_button "Log out"
    expect(page).to have_content("Sign Up Log In")
  end
end
