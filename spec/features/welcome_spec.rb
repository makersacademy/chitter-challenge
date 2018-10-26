feature "Welcome to Chitter!" do

  scenario "I see a welcome page with a greeting" do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "I see a welcome page with a sign up button" do
    visit('/')
    expect(page).to have_button "Sign Up"
  end
end
