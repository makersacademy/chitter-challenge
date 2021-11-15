feature 'Testing infrastructure' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter, You have signed up successfully!"
  end
end

feature 'Viewing peeps' do 
  scenario 'A user can see peeps' do
  
    connection = PG.connect(dbname: 'chitter_test')

    # add test data
    connection.exec("INSERT INTO peeps VALUES(1, 'This is the first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is the second peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'This is the third peep');")

    visit('/peeps')
    expect(page).to have_content('This is the first peep')
    expect(page).to have_content('This is the second peep')
    expect(page).to have_content('This is the third peep')
  end
end
