feature "Registration" do
  scenario "A maker can sign up" do
    sign_up

    expect(page).to have_content "Welcome BenSE"
  end

  scenario "The maker's email must be unique" do
    sign_up

    visit "makers/new"
    fill_in "email", with: "bensheridanedwards@makers.com"
    fill_in "password", with: "password"
    fill_in "name", with: "Ben"
    fill_in "username", with: "Ben10"
    click_button "Sign Up"

    expect(page).not_to have_content "Welcome Ben10"
    expect(page).to have_content "Email or username already registered"
  end

  scenario "The maker's username must be unique" do
    sign_up

    visit "makers/new"
    fill_in "email", with: "bensheridanedwards10@makers.com"
    fill_in "password", with: "password"
    fill_in "name", with: "Ben"
    fill_in "username", with: "BenSE"
    click_button "Sign Up"

    expect(page).not_to have_content "Welcome BenSE"
    expect(page).to have_content "Email or username already registered"
  end
end
