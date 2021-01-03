feature "So that I can let people know what I am doing," do
  scenario "I want to post a message (peep) to chitter" do
    User.create(name: "User 1")
    visit("/peeps/new")
    fill_in("message", with: "Test message")
    click_button("Peep")
    expect(page).to_not have_content "Sinatra"
    expect(current_path).to eq "/peeps"
    expect(page).to have_content("Test message")
    expect(first(".peep")).to have_content "Test message"
  end
end
