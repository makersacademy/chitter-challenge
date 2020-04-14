feature 'viewing messages' do 
  scenario 'visiting the index page' do 
    visit ('/')
    expect(page).to have_content "Chitter"
  end 
  scenario 'seeing a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, name) VALUES('viewing messages is fun', 'Harry');")
    connection.exec("INSERT INTO peeps (message, name) VALUES('databases are fun', 'Guy');")
    # REFRACTOR Messages.create(message: 'viewing messages are fun', name: 'Harry')
    visit ('/')

    expect(page).to have_content "viewing messages is fun"
    expect(page).to have_content "databases are fun"
    expect(page).to have_content "Harry"
    expect(page).to have_content "Guy"
  end 

  scenario 'seeing the time ' do
    connection = PG.connect(dbname: 'chitter_test')
    Messages.create(message: 'What is the time?', name: 'Mr Time')
    visit ('/')
    
    expect(page).to have_content (/\w{4}-.{2}-\w{2}.\w{2}:\w{2}/)
    
  end 

end 