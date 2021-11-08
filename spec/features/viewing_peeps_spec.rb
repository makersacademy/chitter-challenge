require 'pg' 

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "chit-chit"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
    Peep.create(peep: 'Whats up Chitter', user_id: user.id)
    Peep.create(peep: 'What do you want to say?', user_id: user.id)
    Peep.create(peep: 'I am hungry', user_id: user.id)
    
    visit('/peeps')

    expect(page).to have_content "Whats up Chitter"
    expect(page).to have_content "What do you want to say?"
    expect(page).to have_content "I am hungry"
  end
end