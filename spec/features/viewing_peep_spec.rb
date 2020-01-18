feature 'Viewing peep' do
  scenario 'A user can see the peeps they posted' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")

    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end 
end
