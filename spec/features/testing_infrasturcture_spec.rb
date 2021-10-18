feature "testing infrastructure" do
  scenario "shows testing" do
    visit ("/")
    expect(page).to have_content "View all Peeps"
  end
end
