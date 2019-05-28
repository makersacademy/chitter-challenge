feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter and Peeps"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'peep_data_test')

    connection.exec("INSERT INTO peeps (text) VALUES ('my first peep');")
    connection.exec("INSERT INTO peeps (text) VALUES ('my second peep');")
    connection.exec("INSERT INTO peeps (text) VALUES ('my third peep');")

    visit('/peeps')

    expect(page).to have_content "my first peep"
    expect(page).to have_content "my second peep"
    expect(page).to have_content "my third peep"
  end
end
