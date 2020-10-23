require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'A user can see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (peep) VALUES ('Congratulations to the Astronauts that left Earth today. Good choice');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Me, in hell: I was told there would be a “special” place for me?');")
    
    visit ('/peeps')

    expect(page).to have_content("Congratulations to the Astronauts that left Earth today. Good choice")
    expect(page).to have_content("Me, in hell: I was told there would be a “special” place for me?")
  end
end
