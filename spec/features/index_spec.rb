require './lib/database_connection'

feature 'index page' do
  scenario 'it shows a list of messages' do
    DatabaseConnection.setup('shore_test')
    DatabaseConnection.query("TRUNCATE TABLE bottles")
    DatabaseConnection.query("INSERT INTO bottles (userid, body, created) VALUES (1, 'Hello World', '1970-01-01 00:00:01');")
    visit '/'
    expect(page).to have_content '1970-01-01 00:00:01 => 1: "Hello World"'
  end
end