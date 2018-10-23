feature "View homepage" do
  scenario "Shows the app title on the index page" do
    visit('/')
    expect(page).to have_content "chitter"
  end
end
