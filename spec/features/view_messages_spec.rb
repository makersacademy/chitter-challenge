feature 'View messages' do
  scenario 'user can view messages on a feed'  do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO messages (message) VALUES('Hi, my name is Riya');")

    visit '/chitter_feed'

    expect(page).to have_content "Hi, my name is Riya"
  end
end
