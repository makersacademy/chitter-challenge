feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content'Peeps'
  end

  scenario 'a user can see peeps' do
    connection = PG.connect(dbname: 'peeps_manager_test')

    #Add a test data
    connection.exec("INSERT INTO peeps VALUES (1, 'my first peep');")
    connection.exec("INSERT INTO peeps VALUES (2, 'my second peep')")
   
    visit ('/peeps')

    expect(page).to have_content'my first peep'
    expect(page).to have_content'my second peep'
  end
end