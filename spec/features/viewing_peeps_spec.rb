feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peeps"
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep_text) VALUES ('This is a peep');")
    connection.exec("INSERT INTO peeps (peep_text) VALUES ('Peep peep!');")
    connection.exec("INSERT INTO peeps (peep_text) VALUES ('peeping away 🐥');")
    
    visit('/peeps')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "Peep peep!"
    expect(page).to have_content "peeping away 🐥"
  end
end
