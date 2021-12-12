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
end