feature "testing infrastructure" do
  scenario "shows testing" do
    visit ("/")
    expect(page).to have_content "Testing infrastructure"
  end
end
