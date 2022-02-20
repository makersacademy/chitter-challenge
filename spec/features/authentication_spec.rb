feature "authentication" do
  scenario "Signing in" do
    sign_up_test_account

    expect(page).to have_content("Welcome Test")
  end

  scenario "error displayed if user types wrong email" do
    sign_up_test_account
    click_button "Sign out"

    click_button "Sign in"
    fill_in(:email, with: "test11111@example.com")
    fill_in(:password, with: "1234")
    click_button "Submit"

    expect(page).to have_content("Please check email or password")
  end

  scenario "error displayed if user types wrong password" do
    sign_up_test_account
    click_button "Sign out"

    click_button "Sign in"
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "wrong_password")
    click_button "Submit"

    expect(page).to have_content("Please check email or password.")
  end

  scenario "Sign out" do
    sign_up_test_account

    click_button "Sign out"

    expect(page).to have_content("You have signed out.")
  end

end
