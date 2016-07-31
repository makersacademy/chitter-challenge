feature "sign out" do
  scenario "user can sign out" do
    sign_in
    click_button "Sign out"
    expect(page).to_not have_content "Hello Ben"
  end
end
