feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Manager"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Peep 1');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Peep 2');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Peep 3');")

    visit('/peeps')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end
end
