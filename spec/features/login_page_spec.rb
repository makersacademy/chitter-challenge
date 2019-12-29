feature "login page" do

  scenario "welcome message and user prompted to login" do
    visit('/')
    expect(page).to have_content("Chitter")
    expect(page).to have_content("Please Sign in")
  end

  scenario "username and password text boxes are present" do
    visit('/')
    expect(page).to have_selector("#email")
    expect(page).to have_selector("#password")
  end
end
