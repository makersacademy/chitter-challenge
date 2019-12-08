feature "index" do
  scenario "page displays 'Welcome to Chitter!'" do
    visit '/'
    expect(page).to have_content("Welcome to Chitter")
  end
end
