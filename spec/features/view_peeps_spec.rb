feature 'Viewing peeps' do
  scenario 'A user can see their peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    #add the test data
    connection.exec("INSERT INTO chits (message) VALUES ('Hello World!');")
    connection.exec("INSERT INTO chits (message) VALUES('This is another peep.');")
    connection.exec("INSERT INTO chits (message) VALUES('This is a third peep');")

    visit '/'
    
    expect(page).to have_content "Hello World!"
  end
end
