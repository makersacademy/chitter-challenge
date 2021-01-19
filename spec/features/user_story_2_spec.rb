feature "2. So that I can see what others are saying," do
  scenario "I want to see all peeps in reverse chronological order" do
    user = User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")

    Peep.create(message: "Peep 1", user_id: user.id)
    Peep.create(message: "Peep 2", user_id: user.id)
    Peep.create(message: "Peep 3", user_id: user.id)

    visit("/peeps")

    expect(page).to_not have_content "Sinatra"
    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(first(".peep")).to have_content "Peep 3"
  end
end
