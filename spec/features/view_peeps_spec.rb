require 'pg'

feature 'View all Peeps on a timeline' do
  scenario 'User can see all peeps posted' do
    connection = PG.connect(dbname: 'test_chitter')

    connection.exec("INSERT INTO peeps VALUES(1, 'Finn', 'Test Peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Finn', 'I am a test peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Finn', 'Me too');")

    visit ('/peeps/timeline')

    expect(page).to have_content 'Test Peep'
    expect(page).to have_content 'I am a test peep'
    expect(page).to have_content 'Me too'
  end
end
