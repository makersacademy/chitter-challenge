feature 'Viewing peeps' do
  scenario 'A user can see peeps reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps_data VALUES(1, 'first peep')")
    connection.exec("INSERT INTO peeps_data VALUES(2, 'second peep')")
    connection.exec("INSERT INTO peeps_data VALUES(3, 'third peep')")

    visit('/peeps')

    expect(page).to have_content "first peep"
    expect(page).to have_content "second peep"
    expect(page).to have_content "third peep"

  end
end