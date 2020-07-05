feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    # connection = PG.connect(dbname: 'chitter_test')
    #
    # # Add the test data
    # connection.exec("INSERT INTO chitter (peeps) VALUES('Hello this is a peep');")
    # connection.exec("INSERT INTO chitter (peeps) VALUES('also a peep');")
    # connection.exec("INSERT INTO chitter (peeps) VALUES('another peep');")

    Peep.send(peep: "Hello this is a peep")
    Peep.send(peep: "also a peep")
    Peep.send(peep: "another peep")

    visit('/chitter')

    expect(page).to have_content "Hello this is a peep"
    expect(page).to have_content "also a peep"
    expect(page).to have_content "another peep"
  end
end
