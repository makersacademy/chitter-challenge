require './lib/database_connection'

feature 'index page' do
  scenario 'it shows a list of messages' do
    clear_table("bottles")
    DatabaseConnection.query("INSERT INTO bottles (userid, body, created) 
                      VALUES (1, 'just setting up my twttr', '2006-03-21 16:50:35');")
    DatabaseConnection.query("INSERT INTO users (id, username, name) VALUES (1, 'jack', 'Jack Dorsey');")                  
    visit '/'
    expect(page).to have_content '2006-03-21 16:50:35' 
    expect(page).to have_content 'just setting up my twttr'
    expect(page).to have_content 'jack'
    expect(page).to have_content 'Jack Dorsey'
  end
end
