feature "user signes up" do
  scenario "user signes up" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Justyna"
    fill_in "username", with: "Kotauror"
    fill_in "email", with: "kot@kot.pl"
    fill_in "password", with: "tesft"
    click_button("Sign Up")
    expect(page).to have_content "Justyna, thank you for signing up! Enjoy chitter!"
  end
end

feature "user signes up" do
  scenario "user signes up with too short data" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Ja"
    fill_in "username", with: "Kotauror"
    fill_in "email", with: "pies@pies.com"
    fill_in "password", with: "test"
    click_button("Sign Up")
    expect(page).to have_content "Please enter at least 4 characters in each field."
  end
end

feature "user signes up" do
  scenario "user gives an existing email" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Justyna"
    fill_in "username", with: "Kotauror"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_button("Sign Up")
    expect(page).to have_content "This email has been already registered."
  end
end
