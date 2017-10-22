feature "When I sign out" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  scenario "the homepage no longer greets me" do

    visit "/sign-in"

    within "form#sign-in" do
      fill_in("username", with: "LadyMacker123")
      fill_in("password", with: "damn3dSp0t")
      click_button "submit"
    end

    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, LadyMacker123!")

    within "form#sign_out" do
      click_button "Sign Out"
    end

    expect(current_path).to eq "/goodbye"
    expect(page.status_code).to eq 200
    expect(page).to have_content("Goodbye!")
    click_link "return"
    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).not_to have_content("Welcome, LadyMacker123!")
    expect(page).to have_content("Welcome, Stranger!")
  end
end
