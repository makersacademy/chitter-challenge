# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature "Signing out" do
  let!(:user) do
    User.create(username: "thebaron", email: "silas@greenback.com",
                password: "nero", password_confirmation: "nero")
  end

  scenario "while being signed in" do
    sign_in(username: "thebaron", password: "nero")
    click_button "Sign out"
    expect(page).to have_content("Goodbye!")
    expect(page).not_to have_content("Welcome to Chitter #{user.username}")
  end
end
