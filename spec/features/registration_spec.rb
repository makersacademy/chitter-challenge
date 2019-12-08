feature "Registration" do
  scenario "A maker can sign up" do
    visit "makers/new"
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "mypassword"
    fill_in "name", with: "Andrea"
    fill_in "username", with: "Angea89"
    click_button "Submit"

    expect(page).to have_content "Welcome Angea89"
  end

  scenario "The maker's email must be unique" do
    visit "makers/new"
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "mypassword"
    fill_in "name", with: "Andrea"
    fill_in "username", with: "Angea89"
    click_button "Submit"

    visit "makers/new"
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "mypassword_2"
    fill_in "name", with: "Andrea_2"
    fill_in "username", with: "Angea89_2"
    click_button "Submit"

    expect(page).not_to have_content "Welcome Angea89_2"
    expect(page).to have_content "Email or username already registered."
  end

  scenario "The maker's username must be unique" do
    visit "makers/new"
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "mypassword"
    fill_in "name", with: "Andrea"
    fill_in "username", with: "Angea89"
    click_button "Submit"

    visit "makers/new"
    fill_in "email", with: "andrea_2@gmail.com"
    fill_in "password", with: "mypassword_2"
    fill_in "name", with: "Andrea_2"
    fill_in "username", with: "Angea89"
    click_button "Submit"

    expect(page).not_to have_content "Welcome Angea89"
    expect(page).to have_content "Email or username already registered."
  end
end
