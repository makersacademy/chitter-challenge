feature 'Viewing peeps' do
  scenario 'A user can see a list of all peeps' do 
    connection = PG.connect(dbname: 'chitter_test')
    time = Time.now.utc
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 1', '#{time}');")
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 2', '#{time}');")
    connection.exec("INSERT INTO peeps(text, time) VALUES('peep 3', '#{time}');")

    visit('/')

    expect(page).to have_content("peep 1")
    expect(page).to have_content("peep 2")
    expect(page).to have_content("peep 3")
  end
end
