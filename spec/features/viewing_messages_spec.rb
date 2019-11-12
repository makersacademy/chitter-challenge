require 'pg'
require "capybara/rspec"

feature 'Viewing messages' do
    scenario 'A user can see the messages of others' do
    connection = PG.connect(dbname: 'Chitter_test')

    connection.exec("INSERT INTO messages (message) VALUES('Hey you! this is Chitter');")
    connection.exec("INSERT INTO messages (message) VALUES('Have something to Chit?');")
    connection.exec("INSERT INTO messages (message) VALUES('Chit it now!');")

    visit('/chits')
  
      expect(page).to have_content("Hey you! this is Chitter")
      expect(page).to have_content("Have something to Chit?")
      expect(page).to have_content("Chit it now!")
      
    end
  end