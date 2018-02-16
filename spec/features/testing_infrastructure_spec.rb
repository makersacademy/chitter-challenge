feature "Testing infrastructure" do
  scenario "Infrastucture works" do 
    visit("/")
    expect(page).to have_content("Testing infrastructure working")
  end
end