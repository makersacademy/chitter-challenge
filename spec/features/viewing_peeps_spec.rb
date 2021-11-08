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

    Peep.create(peep: 'Whats up Chitter')
    Peep.create(peep: 'What do you want to say?')
    Peep.create(peep: 'I am hungry')
    
    visit('/peeps')

    expect(page).to have_content "Whats up Chitter"
    expect(page).to have_content "What do you want to say?"
    expect(page).to have_content "I am hungry"
  end
end