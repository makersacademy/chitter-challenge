feature "Chitter homepage" do
  scenario "when visiting chitter homepage" do
    visit '/'
    expect(page).to have_content("Welcome to Chitter")
  end
end