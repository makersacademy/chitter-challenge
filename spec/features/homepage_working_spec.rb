feature "welcome message" do
  scenario "user visits homepage" do
  
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
  end
end