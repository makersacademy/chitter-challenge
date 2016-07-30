feature "sign out" do
  scenario "user can sign out" do
    create_user
    visit"/signin"
    fill_in "user_name", with: "Ben09"
    fill_in "password", with: "1234"
    click_button "Sign in"
    click_button "Sign out"
    expect(page).to_not have_content "Hello Ben"
  end
end
