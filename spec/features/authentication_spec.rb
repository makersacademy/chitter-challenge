feature "authentication" do
  scenario "Signing in" do
    visit("/")
    sign_up_test_account

    click_button "Sign in"
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "1234")
    click_button "Sign in"

    expect(page).to have_content("Welcome test@example.com")
  end

  scenario "error displayed if user types wrong email" do
    visit("/")
    sign_up_test_account

    click_button "Sign in"
    fill_in(:email, with: "test11111@example.com")
    fill_in(:password, with: "1234")
    click_button "Sign in"

    expect(page).to have_content("Please check email or password")
  end

  scenario "error displayed if user types wrong password" do
    visit("/")
    sign_up_test_account

    click_button "Sign in"
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "wrong_password")
    click_button "Sign in"

    expect(page).to have_content("Please check email or password")
  end


end