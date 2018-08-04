feature "testing infrastructure" do
  scenario "visiting root page" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end
