feature 'showing all peeps' do
  scenario 'user sees all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep, time) VALUES ('Test Peep 1', '11:00');")
    connection.exec("INSERT INTO peeps (peep, time) VALUES ('Test Peep 2', '11:30');")
    connection.exec("INSERT INTO peeps (peep, time) VALUES ('Test Peep 3', '11:45');")

    visit('/peeps')
    
    expect(page).to have_content "Test Peep 1"
    expect(page).to have_content "11:00"
    expect(page).to have_content "Test Peep 2"
    expect(page).to have_content "11:30"
    expect(page).to have_content "Test Peep 3"
    expect(page).to have_content "11:45"
  end
end
