feature 'Viewing Peeps' do
  scenario 'user can see all peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is a test peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a test peep 2');")

    visit '/peeps'

    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'This is a test peep 2'
  end
end
