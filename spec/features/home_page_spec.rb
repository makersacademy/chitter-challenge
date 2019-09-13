require './app.rb'

feature 'checks if pstst are displayed on the homepage' do
  scenario 'there is a name and a message on the homepage' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO posts (name,message) VALUES ('Tom','test message');")
    visit('/')
    expect(page).to have_content('Tom')
    expect(page).to have_content('test message')
  end
end
