feature "Signing out" do
  scenario "User can sign out" do
    sign_up
    click_button "Sign out"
    expect(page).to have_content("You have signed out of Chitter")
  end
end
