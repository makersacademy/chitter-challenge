# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'post peep' do
  scenario 'a user can post a new peep' do
    visit ('/peeps')

    user = User.create(name: "Jo Shmo", username: "Shmo89", email: "test@example.com", password: "password123")

    click_button('Post peep')
    peep = Peep.create(content: "This is my third peep!", user_id: user.id)
    expect(page).to have_content(peep.content)
    expect(current_path).to eq('/peeps')
  end
end 