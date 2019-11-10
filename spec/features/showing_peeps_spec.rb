feature 'showing all peeps' do
  scenario 'user sees all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Test Peep 1');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Test Peep 2');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Test Peep 3');")

    visit('/peeps')
    
    expect(page).to have_content "Test Peep 1"
    expect(page).to have_content "Test Peep 2"
    expect(page).to have_content "Test Peep 3"
  end
end
