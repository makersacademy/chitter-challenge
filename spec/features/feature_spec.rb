feature 'Chitter' do

  scenario 'seeing a home page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

  scenario 'seeing messages on home page' do
    connection = PG.connect(dbname: 'chitterdb_test')

    connection.exec("INSERT INTO messages (message_text, author_handle) VALUES ('Where''s my head?', '@winter_coming');")
    visit '/'
    expect(page).to have_content "Where's my head?"
  end

end
