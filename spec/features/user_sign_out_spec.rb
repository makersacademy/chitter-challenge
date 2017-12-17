feature "user sign out" do

  scenario "user can sign out" do
    user_sign_up
    user_sign_in
    click_on "Sign out"
    expect(page).to have_content "Goodbye"
    expect(page).not_to have_content "Welcome Ellie W"
  end
end
