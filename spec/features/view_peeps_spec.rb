feature 'can see all peeps' do
  scenario 'see all peep messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Hello')")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Hey')")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Hi')")

    visit '/peeps'

    expect(page).to have_content "Hello"
    expect(page).to have_content "Hi"
    expect(page).to have_content "Hey"

  end

  scenario 'can see peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Hello')")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Hey')")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Hi')")

    visit '/peeps'

    expect("Hi").to appear_before "Hey"
    expect("Hey").to appear_before "Hello"

  end

  scenario 'can see what time of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep, time) VALUES ('Hello', '2018-09-01 12:00')")

    visit '/peeps'

    expect(page).to have_content "Hello"
    expect(page).to have_content "2018-09-01 12:00"
  end

end
