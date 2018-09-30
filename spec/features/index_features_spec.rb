require 'pg'

feature 'Index page' do
  scenario 'should welcome me to the page' do
    visit('/')
    expect(page).to have_content("Chitter")
  end

  scenario 'should have a field to let me enter my message and submit it' do
    visit('/')
    fill_in 'message', with: 'Hello world'
    click_on 'Submit'
  end

  scenario 'should show me the messages I posted' do
    visit('/')
    fill_in 'message', with: 'First message'
    click_on 'Submit'
    expect(page).to have_content 'First message'
  end

  scenario 'viewing messages in database on page' do
    connection = PG.connect(dbname: 'chitter_db_test')
    connection.exec("INSERT INTO posts (message) VALUES ('First message');")
    connection.exec("INSERT INTO posts (message) VALUES ('Second message');")

    visit('/')
    expect(page).to have_content 'First message'
    expect(page).to have_content 'Second message'
  end
end
