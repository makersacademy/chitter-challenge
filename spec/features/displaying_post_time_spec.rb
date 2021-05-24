# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature "So that I can better appreciate the context of a peep" do
  scenario "I want to see the time at which it was made" do
    user =  User.create(name: "Sally Mole", username: "Molly89", email: "test@example.com", password: "password123")
    peep = Peep.create(content: "This is my third peep!", user_id: user.id)

    visit("/peeps")

    expect(page).to have_content peep.time_created.strftime("on %A at %H:%M %p")
  end
end