feature "So that I can post messages on Chitter as me," do
  scenario "I want to sign up for Chitter" do
    visit("/users/new")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "password123")
    fill_in("name", with: "User 1")
    fill_in("user_name", with: "Usr1")
    click_button("Submit")
    expect(page).not_to have_content "Sinatra"
    expect(current_path).to have_content "/peeps"
    expect(page).to have_content "User 1"
  end
end
