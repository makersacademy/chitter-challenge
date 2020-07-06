feature "Testing infrastructure" do
  scenario "Home page contains text: 'Welcome to Chitter" do
    visit "/"
    expect(page).to have_text "Welcome to Chitter"
  end
end
