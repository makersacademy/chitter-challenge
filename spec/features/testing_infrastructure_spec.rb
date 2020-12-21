feature "Basic Infrastructure" do
  scenario "it has an index page" do
    visit('/')
    expect(page).to have_content("Welcome to Chitter!")
  end
end
