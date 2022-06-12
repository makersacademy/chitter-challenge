require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Chatter"
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_chatter_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")
    connection.exec("INSERT INTO peeps (content) VALUES ('This is my second peep');")
    connection.exec("INSERT INTO peeps (content) VALUES ('This is my third peep');")

    visit('/peeps')

    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "This is my second peep"
    expect(page).to have_content "This is my third peep"
  end
end

  

  # WE WILL DO THIS LATER ON: 
  # scenario 'A user can see peeps in reverse order' do
  #   visit('/peeps')
  #   peeps = Peep.all
  #   expect(peeps).to eq ["This is my third peep", "This is my second peep", "This is my first peep"]
  # end