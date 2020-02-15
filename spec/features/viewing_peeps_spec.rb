require 'pg'

feature 'View peeps' do
  scenario 'A user can view peeps' do
    connection = PG.connect(dbname: "chitter_test")

    connection.exec("INSERT INTO peeps VALUES(1, 'This is my first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is my second peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'This is my third peep');")
    
    visit('/peeps')

    expect(page).to have_content("This is my third peep")
    expect(page).to have_content("This is my second peep")
    expect(page).to have_content("This is my first peep")
  end
end
