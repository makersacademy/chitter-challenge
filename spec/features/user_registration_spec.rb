feature "User registration" do
  scenario "User can register for Chitter" do
    visit("/users/new")
    fill_in 'name', with: "Serena"
    fill_in 'username', with: "Serena1"
    fill_in 'email', with: "serena@example.com"
    fill_in 'password', with: "Serena@123"
    click_button("Register")
    expect(page).to have_content("Chitter")
  end
end
