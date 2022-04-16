feature "Chitter" do
  scenario "has a homepage" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end
