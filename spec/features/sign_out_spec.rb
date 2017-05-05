feature "user signs out" do

  before(:each) do
    User.create(email: "test@test.com", password: "123", password_confirmation: "123")
  end

  # As a Maker
  # So that I can avoid others posting messages on Chitter as me
  # I want to log out of Chitter
  scenario "while being signed in" do
    sign_in(email: "test@test.com", password: "123")
    click_button "Sign out"
    expect(page).to have_content "You have successfully signed out"
    expect(page).not_to have_content "Welcome, test@test.com!"
  end

end