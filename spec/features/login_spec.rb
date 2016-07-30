require './app/models/user'

feature "login" do
  scenario "user can visit login page" do
    visit "/login"
    expect(page.status_code).to eq 200
  end
  context "valid e-mail and password" do
    scenario "user sees welcome message after logging in correctly" do
      user = User.create(email: "hulk@gmail.com", password: "smash")
      visit "/login"
      fill_in "email", with: "hulk@gmail.com"
      fill_in "password", with: "smash"
      click_button "Login"
      expect(page).to have_content "Welcome hulk@gmail.com!"
    end
  end
  context "invalid e-mail and password" do
    scenario "user sees error message after inputting incorrect password" do
      user = User.create(email: "hulk@gmail.com", password: "smash")
      visit "/login"
      fill_in "email", with: "hulk@gmail.com"
      fill_in "password", with: "jump"
      click_button "Login"
      expect(page).to have_content "The email or password is incorrect"
    end
  end  
end
