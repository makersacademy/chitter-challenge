feature 'Viewing peeps' do
  scenario "A user can see peeps" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Test Peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Peep Testing!');")
    visit('/view')
    expect(page).to have_content "Test Peep"
    expect(page).to have_content "Peep Testing!"
  end
end
