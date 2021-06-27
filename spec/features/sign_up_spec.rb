feature "I can sign up to chitter" do
  scenario "create an account" do
    visit('/')
    click_button('Sign up')
    fill_in("email", with: "name@example.com")
    fill_in("name", with: "Willoughby Hood")
    fill_in("username", with: "wh3g")
    fill_in("password", with: "password123")
    click_button("Submit")

    expect(page).to have_content("Welcome, Willoughby Hood")
  end
end
