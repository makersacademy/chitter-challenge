feature "welcome message" do
  scenario "when on the home" do
  
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
  end
end