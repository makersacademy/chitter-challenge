require 'pg'

feature 'Viewing the homepage' do
  scenario 'The page title is visible' do 
    visit ('/')

    expect(page).to have_content 'Welcome to Chitter'
  end
end 

feature 'View all Peeps' do
  scenario 'A user can view all previous Peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Elon who?');")
    connection.exec("INSERT INTO peeps VALUES(2, 'COYS');")
    connection.exec("INSERT INTO peeps VALUES(3, '123456789');")
    
    visit ('/peeps')

    expect(page).to have_content 'Elon who?'
    expect(page).to have_content 'COYS'
    expect(page).to have_content '123456789'
  end
end