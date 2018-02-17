feature "user signes up" do
  scenario "user signes up" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Justyna"
    fill_in "username", with: "Kotauror"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "tesft"
    click_button("Sign Up")
    expect(page).to have_content "Justyna, thank you for signing up! Enjoy chitter!"
  end
end

feature "user signes up" do
  scenario "user gives an invalid email" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Justyna"
    fill_in "username", with: "Kotauror"
    fill_in "email", with: "test"
    fill_in "password", with: "test"
    click_button("Sign Up")
    expect(page).to have_content "Please enter a valid email."
  end
end

feature "user signes up" do
  scenario "user signes up with too short data" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Ja"
    fill_in "username", with: "Kotauror"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_button("Sign Up")
    expect(page).to have_content "Please enter at least 4 characters in each field."
  end
end
