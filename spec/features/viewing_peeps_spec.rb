feature 'Viewing peeps' do
  scenario 'Users can see my peeps' do
    connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (content) VALUES('This is my first chitter!');")
      connection.exec("INSERT INTO peeps (content) VALUES('Hey there! This is a peep!');")
      connection.exec("INSERT INTO peeps (content) VALUES('Urgh! The weather today is horrible.');")
      connection.exec("INSERT INTO peeps (content) VALUES('Coronavirus is really killing the mood here');")
    visit('/peeps')

    expect(page).to have_content "Hey there! This is a peep!"
    expect(page).to have_content "Urgh! The weather today is horrible."
    expect(page).to have_content "Coronavirus is really killing the mood here"
  end
end