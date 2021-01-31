feature "welcome message" do
  scenario "user visits homepage" do
  
    visit('/')
    expect(page).to have_content("Welcome To Chitter")
  end
end