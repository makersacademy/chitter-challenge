feature "registration" do
  scenario "'Sign Up' button on main page" do
    visit '/'
    expect(page).to have_selector(:button, "Sign Up")
  end

  context "user clicks button" do
    before do
      visit '/'
      click_button "Sign Up"
    end

    scenario "clicking sign up button takes user to sign up form" do
      expect(page).to have_field(:username)
      expect(page).to have_field(:password)
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
    end

    scenario "filling in form displays welcome message on peeps page" do
      fill_in("username", with: "user1")
      fill_in("password", with: "password1")
      fill_in("name", with: "Mr User")
      fill_in("email", with: "user@example.com")
      click_button "Submit"
      expect(page).to have_content "Welcome, Mr User!"
    end
  end
end
