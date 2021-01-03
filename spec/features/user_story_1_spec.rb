feature "So that I can let people know what I am doing," do
  scenario "I want to post a message (peep) to chitter" do
    visit("/users/new")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "password123")
    fill_in("name", with: "User 1")
    fill_in("user_name", with: "Usr1")
    click_button("Submit")
    click_button("+")
    fill_in("message", with: "Test message")
    click_button("Peep")
    expect(page).to_not have_content "Sinatra"
    expect(current_path).to eq "/peeps"
    expect(page).to have_content("Test message")
    expect(first(".peep")).to have_content "Test message"
  end
end
