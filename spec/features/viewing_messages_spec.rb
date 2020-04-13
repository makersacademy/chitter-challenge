feature 'viewing messages' do 
  scenario 'visiting the index page' do 
    visit ('/')
    expect(page).to have_content "Chitter"
  end 
  scenario 'seeing a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, name) VALUES('viewing messages is fun', 'Harry');")
    connection.exec("INSERT INTO peeps (message, name) VALUES('databases are fun', 'Guy');")
    #new_message = Messages.create(message: 'viewing messages are fun', name: 'Harry')
    visit ('/')

    expect(page).to have_content "viewing messages is fun"
    expect(page).to have_content "databases are fun"
    expect(page).to have_content "Harry"
    expect(page).to have_content "Guy"
  end 
end 