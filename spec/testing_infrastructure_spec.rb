feature "Test environment" do
  scenario "is working correctly" do
    visit('/')
    expect(page).to have_content "Testing infrastructure: ONLINE"
  end
end