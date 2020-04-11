require 'pg'

feature 'Viewing peeps' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'user can see peeps' do
    connection =  PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (content) VALUES('What a day to peep!');")
    connection.exec("INSERT INTO peeps (content) VALUES('Happy Easter');")

    visit('/peeps')

    expect(page).to have_content "What a day to peep!"
    expect(page).to have_content "Happy Easter"
  end
end