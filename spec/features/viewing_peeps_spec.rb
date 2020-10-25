require 'pg'

feature 'viewing peeps in reverse chronological order' do
  scenario 'User is able to see a feed page of peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO peeps (peep) VALUES ('I saw twelve chickens in the park earlier');")
    connection.exec("INSERT INTO peeps (peep) VALUES('There are 9 million bicycles in Beijing');")
    visit('/chitter_feed')
    expect(page).to have_content('I saw twelve chickens in the park earlier')
    expect(page).to have_content('There are 9 million bicycles in Beijing')
    #haven't actually viewed in reverse chron 
  end
end