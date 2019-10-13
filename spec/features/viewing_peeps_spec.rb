feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Its my first peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Peep, peep, peep!');")

    visit('/peeps')

    expect(page).to have_content "Its my first peep!"
    expect(page).to have_content "Peep, peep, peep!"
  end
end
