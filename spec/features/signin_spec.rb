feature "Signing in" do
  scenario "User can sign in" do
    sign_up
    #sign out?
    visit "/sign-in"
    within "form#sign-in" do
      fill_in("password", with: "damn3dSp0t")
      fill_in("username", with: "LadyMacker123")
      click_button "submit"
    end
    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, LadyMacker123!")
  end
end
