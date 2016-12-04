feature "Login" do
  scenario "user fills in their email address and password" do
    visit "/"
    login
    expect(page.current_path).to eq "/peeps"
  end
end
