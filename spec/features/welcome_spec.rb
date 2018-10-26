feature "Welcome to Chitter!" do

  scenario "I see a welcome page with a greeting" do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "I see a welcome page with a sign up button" do
    visit('/')
    expect(page).to have_button "Sign Up"
  end

  scenario "I see a welcome page with a log in button" do
    visit('/')
    expect(page).to have_button "Log In"
  end

end
