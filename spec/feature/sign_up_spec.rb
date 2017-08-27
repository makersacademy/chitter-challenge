feature "Sign Up Page" do
  scenario "Loads correctly" do
    visit '/login'
    expect(page.status_code).to eq 200
  end

  scenario "Creates a new user when the form is filled in" do
    fill_in :username, with: "UserTest"
    fill_in :password, with: "Password Test"
    fill_in :password_confirmation, with: "Password Test"
    fill_in :email, with: "example@makers.com"
    click_button "Sign Up"
    expect(page).to have_content "Sign up successful"
  end
end
