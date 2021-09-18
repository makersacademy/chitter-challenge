require 'setup_test_database'

feature 'view all peeps' do
  scenario 'user is able to see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (timestamp, post) VALUES (NOW(), 'this is a test message');")
    connection.exec("INSERT INTO peeps (timestamp, post) VALUES (NOW(), 'this is another test message');")
    visit '/'
    click_button 'See latest Peeps!'

    expect(page).to have_content 'this is a test message'
  end
end
