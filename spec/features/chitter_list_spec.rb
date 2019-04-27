feature 'Viewing peeps' do
  scenario 'checks current peeps' do
    connection = PG.connect :dbname => 'chitter_test'

    connection.exec("INSERT INTO peeps (message, user_id, posted_time) VALUES ('Hello!', 'Makers', '27/04/2019');")
    visit('/chitters')
    expect(page).to have_content "Hello!"
  end
end
