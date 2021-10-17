feature "signing up" do
  scenario "allows a user to sign up" do
    visit ('/register')
    fill_in "username", with: "Dajox"
    fill_in "password", with: "password123"
    click_button "Submit"
    fill_in "username", with: "Dajox"
    fill_in "password", with: "password123"
    click_button "Submit"

    expect(page).to have_content "Welcome, Dajox"
    expect(page).not_to have_content "password123"
  end
end
