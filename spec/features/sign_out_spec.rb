feature "sign out" do
  scenario "Click sign out and get a message of confirmation" do
    register
    click_on "Log out?"
    expect(page).to have_content "Successfully logged out"
  end
end
