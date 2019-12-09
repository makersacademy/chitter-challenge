feature "registering new user" do


  scenario "should register a new user to the database and return to the login screen" do
    visit('/')
    click_button "sign_up"
    fill_in "grip", with: "&abacon"
    fill_in "name", with: "Andrew Bacon"
    fill_in "email", with: "abacon@email.com"
    fill_in "password", with: "password1"
    click_button "submit"

    expect(page).to have_content("Welcome, &abacon")
  end


end