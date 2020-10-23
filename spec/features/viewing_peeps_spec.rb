require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'A user can see all peeps' do
    
    Peep.create(peep:'Congratulations to the Astronauts that left Earth today. Good choice')
    Peep.create(peep: 'Me, in hell: I was told there would be a “special” place for me?')
    
    visit('/peeps')

    expect(page).to have_content("Congratulations to the Astronauts that left Earth today. Good choice")
    expect(page).to have_content("Me, in hell: I was told there would be a “special” place for me?")
  end

  scenario 'A user can see peeps in reverse cronological order' do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep,timestamp) VALUES('Congratulations to the Astronauts that left Earth today. Good choice', '2020-10-23 16:41');")
    connection.exec("INSERT INTO peeps (peep,timestamp) VALUES('Me, in hell: I was told there would be a “special” place for me?', '2020-10-23 15:00');")

    visit('/peeps')

    page.body.index("Me, in hell: I was told there would be a “special” place for me?").should < page.body.index("Congratulations to the Astronauts that left Earth today. Good choice")
  end
end
