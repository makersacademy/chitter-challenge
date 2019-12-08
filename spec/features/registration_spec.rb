feature "Registration" do
  scenario "A Maker can sign up" do
    visit "makers/new"
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "mypassword"
    fill_in "name", with: "Andrea"
    fill_in "username", with: "Angea89"
    click_button "Submit"

    expect(page).to have_content "Welcome Angea89"
  end
end
