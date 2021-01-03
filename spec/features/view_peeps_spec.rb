feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (content) VALUES('test peep');")
    connection.exec("INSERT INTO peeps (content) VALUES('another test peep');")
    connection.exec("INSERT INTO peeps (content) VALUES('a third test peep');")

    visit('/peeps')
    expect(page).to have_content "test peep"
    expect(page).to have_content "another test peep"
    expect(page).to have_content "a third test peep"
  end
end
