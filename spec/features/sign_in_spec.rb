feature "signing in" do
  before do
    create_user
    reset_users
  end
  scenario "'Sign In' button on main page" do
    visit '/'
    expect(page).to have_selector(:button, "Sign In")
  end

  context "user clicks button" do
    before do
      visit '/'
      click_button "Sign In"
    end

    scenario "user sees sign in form" do
      expect(page).to have_field(:username)
      expect(page).to have_field(:password)
    end

    context "user fills in form" do
      before do
        fill_in("username", with: "user1")
        fill_in("password", with: "password1")
        click_button "Submit"
      end

      scenario "user sees welcome message on peeps page" do
        expect(page).to have_content "Welcome, Mr User!"
      end

      scenario "user does not see Sign Up/In button on peeps page" do
        expect(page).not_to have_selector(:button, "Sign Up")
        expect(page).not_to have_selector(:button, "Sign In")
      end

    end
  end
end
