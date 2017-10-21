feature "Signing in" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  scenario "User can sign in" do

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
