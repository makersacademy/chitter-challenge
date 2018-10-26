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

    scenario "user sees sign up form" do
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
    end

    context "user fills in form" do
      before do
        fill_in("username", with: "user1")
        fill_in("password", with: "password1")
        fill_in("name", with: "Mr User")
        fill_in("email", with: "user@example.com")
        click_button "Submit"
      end

      scenario "user sees welcome message on peeps page" do
        expect(page).to have_content "Welcome, Mr User!"
      end
      scenario "user does not see Sign In button on peeps page" do
        expect(page).not_to have_selector(:button, "Sign Up")
      end
    end

  end
end
