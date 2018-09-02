feature 'can see all peeps' do
  scenario 'see all peep messages' do
    connection = PG.connect(dbname: 'chitter_test')
      
    connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hello', '#{user_id}');")

    visit '/peeps'

    expect(page).to have_content "Hello"
    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Scarface"

  end

  scenario 'can see peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hello', '#{user_id}');")
    connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hey', '#{user_id}');")
    connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hi', '#{user_id}');")

    visit '/peeps'

    expect("Hi").to appear_before "Hey"
    expect("Hey").to appear_before "Hello"

  end

  scenario 'can see what time of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep, time, user_id) VALUES ('Hello', '2018-09-01 12:00', '#{user_id}')")

    visit '/peeps'

    expect(page).to have_content "Hello"
    expect(page).to have_content "2018-09-01 12:00"
  end

end
