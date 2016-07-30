feature "Logging out" do
  before do
    sign_up
    sign_in
  end

  scenario "user can log out" do
    click_button "Logout"
    expect(page).to have_content "You have been logged out"
    expect(page).to_not have_content "Welcome, @joedoe"
  end
end
