
feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Peep1');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Peep2');")
    
    visit '/peeps'

    expect(page).to have_content "Peep1"
    expect(page).to have_content "Peep2"
  end
end
