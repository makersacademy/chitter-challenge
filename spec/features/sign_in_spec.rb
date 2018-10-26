feature "signing in" do
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
  end
end
