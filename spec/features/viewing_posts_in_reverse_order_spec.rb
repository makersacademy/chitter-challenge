# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'view peeps in reverse order' do
  scenario 'a user can see all peeps in reverse order' do

    user = User.create(name: "Sally Mole", username: "Molly89", email: "test@example.com", password: "password123")

    Peep.create(content: "This is my first peep!", user_id: user.id)
    Peep.create(content: "This is my second peep!", user_id: user.id)
    Peep.create(content: "This is my third peep!", user_id: user.id)


    visit ('/peeps')

    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('This is my second peep!')
    expect(first(".peep")).to have_content('This is my third peep!')
  end
end 