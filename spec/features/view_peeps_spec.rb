require 'pg'

feature 'View all Peeps on a timeline' do
  scenario 'User can see all peeps posted' do
    connection = PG.connect(dbname: 'test_chitter')

    Peep.create(name: "Finn", text: "Test Peep")
    Peep.create(name: "Finn", text: "I am a test peep")
    Peep.create(name: "Finn", text: "Me too")

    visit ('/peeps/timeline')

    expect(page).to have_content "Finn peeped: Test Peep"
    expect(page).to have_content "Finn peeped: I am a test peep"
    expect(page).to have_content "Finn peeped: Me too"
  end
end
