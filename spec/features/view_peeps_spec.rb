feature 'view all Peeps' do
  scenario 'A user can see all peeps on one page' do
    visit('/')
    connection = PG.connect(dbname:'peep_manager_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Welcome to Chitter');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is my first Peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Peeping to my peeps');")

    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_content 'This is my first Peep'
    expect(page).to have_content 'Peeping to my peeps'
  end
end
