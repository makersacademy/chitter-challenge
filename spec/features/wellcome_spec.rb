feature "Welcome" do
  scenario "Users visit a welcome page" do
    visit '/'
    expect(page).to have_content("Welcome to Chitter!")
  end
end