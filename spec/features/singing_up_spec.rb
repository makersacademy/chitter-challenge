feature "user signes up" do
  scenario "user signes up" do
    visit('/')
    click_button("Sign Up")
    fill_in "Name", with: "Justyna"
    fill_in "Username", with: "Kotauror"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_button("Sign Up")
    expect(page).to have_content "Justyna, thank you for signing up! Enjoy chitter!"
  end
end
