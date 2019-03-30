feature 'Viewing peeps' do
  scenario 'User goes to Chitter main page to view peeps' do

    connection = PG.connect(dbname: 'chitter_app_test')

    # Add the test data
    connection.exec("INSERT INTO peep_messages VALUES(1, 'Peep 1 by Pusheen');")
    connection.exec("INSERT INTO peep_messages VALUES(2, 'Peep 2 by Gudetama');")
    connection.exec("INSERT INTO peep_messages VALUES(3, 'Peep 3 by Yoda');")

    visit('/peeps')

    expect(page).to have_content "Peep 1 by Pusheen"
    expect(page).to have_content "Peep 2 by Gudetama"
    expect(page).to have_content "Peep 3 by Yoda"
  end
end
