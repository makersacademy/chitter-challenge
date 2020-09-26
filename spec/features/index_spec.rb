require './lib/database_connection'

feature 'index page' do
  scenario 'it shows a list of messages' do
    DatabaseConnection.setup('shore_test')
    DatabaseConnection.query("TRUNCATE TABLE bottles")
    DatabaseConnection.query("INSERT INTO bottles (userid, body, created) 
                      VALUES (1, 'just setting up my twttr', '2006-03-21 16:50:35');")
    visit '/'
    expect(page).to have_content '2006-03-21 16:50:35 => 1: just setting up my twttr'
  end
end