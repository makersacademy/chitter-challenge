require 'pg' 

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "All chitter peeps"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Whats up Chitter');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('What do you want to say?');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('I am hungry');")
    
    visit('/peeps')

    expect(page).to have_content "Whats up Chitter"
    expect(page).to have_content "What do you want to say?"
    expect(page).to have_content "I am hungry"
  end
end