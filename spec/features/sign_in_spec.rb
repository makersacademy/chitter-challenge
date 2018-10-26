feature "signing in" do
  before do
    visit '/'
    sign_up_1
    click_button "Sign Out"
  end
  scenario "'Sign In' button on main page" do
    expect(page).to have_selector(:button, "Sign In")
  end

  context "user clicks button" do
    before do
      click_button "Sign In"
    end

    scenario "user sees sign in form" do
      expect(page).to have_field(:username)
      expect(page).to have_field(:password)
    end

    context "user enters valid details" do
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

    context "user enters invalid details" do
      scenario "invalid password" do
        fill_in("username", with: "user1")
        fill_in("password", with: "wrong_password")
        click_button "Submit"
        expect(page).to have_content "Incorrect username or password."
      end

      scenario "invalid username" do
        fill_in("username", with: "wrong_user")
        fill_in("password", with: "password1")
        click_button "Submit"
        expect(page).to have_content "Incorrect username or password."
      end
    end
  end
end
