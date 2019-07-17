
feature 'is posting message on web' do
  scenario 'User can see their message' do
     test_connection = PG.connect(dbname: 'chitter_test')

     test_connection.exec("INSERT INTO messages VALUES(1, 'Your New Peep is now life!');")

     visit('/peep')

     expect(page).to have_content "Your New Peep is now life!"
  end
end
