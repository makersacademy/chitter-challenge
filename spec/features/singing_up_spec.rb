require_relative 'web_helpers'

feature "user signes up" do
  scenario "user gives an existing email" do
    sign_up
    click_button("Sign Up")
    fill_in "name", with: "Justyna"
    fill_in "username", with: "Kotaaaufafaror"
    fill_in "email", with: "Justyna@Justyna"
    fill_in "password", with: "test"
    click_button("Submit")
    expect(page).to have_content "This email has been already registered."
  end
end

feature "user signes up" do
  scenario "user gives an existing username" do
    sign_up
    click_button("Sign Up")
    fill_in "name", with: "whoever"
    fill_in "username", with: "Justyna"
    fill_in "email", with: "othertest@.com"
    fill_in "password", with: "test"
    click_button("Submit")
    expect(page).to have_content "This username has been already registered."
  end
end

feature "user signes up" do
  scenario "user signes up" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Justyna"
    fill_in "username", with: "Kotaurfaaor"
    fill_in "email", with: "kot@kaaaot.pl"
    fill_in "password", with: "tesft"
    click_button("Submit")
    expect(page).to have_content "Kotaurfaaor, thank you for signing up! Enjoy chitter!"
  end
end

feature "user signes up" do
  scenario "user signes up with too short data" do
    visit('/')
    click_button("Sign Up")
    fill_in "name", with: "Ja"
    fill_in "username", with: "Kotssaufafror"
    fill_in "email", with: "pieaas@pies.com"
    fill_in "password", with: "test"
    click_button("Submit")
    expect(page).to have_content "Please enter at least 4 characters in each field."
  end
end
