feature 'view messages' do
  scenario 'user goes on the peeps page and sees the peeps' do
    connection = PG.connect( dbname: 'chitter_test' )
    connection.exec( "INSERT INTO chitter (time, message) VALUES ('08:00', 'Hello world 3');" )
    connection.exec( "INSERT INTO chitter (time, message) VALUES ('08:00', 'Hello world 4');" )

    visit('/')

    expect(page).to have_content("Hello world 3")
    expect(page).to have_content("Hello world 4")
  end
end