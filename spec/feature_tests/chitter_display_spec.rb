feature "View Chitter" do
  scenario "Can visit the home page" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end
end
