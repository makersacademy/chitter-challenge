feature 'viewing messages' do 
  scenario 'visiting the index page' do 
    visit ('/')
    expect(page).to have_content "Chitter"
  end 
  scenario 'seeing a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, name) VALUES('hi', 'Gina');")
    connection.exec("INSERT INTO peeps (message, name) VALUES('databases are fun', 'Guy');")
    
    visit ('/')

    expect(page).to have_content "hi"
    expect(page).to have_content "databases are fun"
    #expect(page).to have_content "Gina"
    #expect(page).to have_content "Guy"
  end 
end 