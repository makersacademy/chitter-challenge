feature "Viewing Chitter" do
  scenario "user can visit the Chitter homepage" do
    visit("/")
    expect(page).to have_content "Welcome to Chitter!"
  end
end
