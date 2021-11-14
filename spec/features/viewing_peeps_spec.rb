require 'pg'

feature 'View peeps' do
  scenario 'A user can see multiple peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES('This is my peep');")
    connection.exec("INSERT INTO peeps (message) VALUES('Another peep');")
    connection.exec("INSERT INTO peeps (message) VALUES('Third peep');")

    visit('/peeps')
    
    expect(page).to have_content 'This is my peep'
    expect(page).to have_content 'Another peep'
    expect(page).to have_content 'Third peep'
  end
end
