feature "Signing out" do
  scenario "User can sign out" do
    sign_up
    click_button "Sign out"
    expect(page).to have_content("You have signed out of Chitter")
    visit '/peeps'
    expect(page).not_to have_content("Welcome to Chitter, Chandler")
  end
end
