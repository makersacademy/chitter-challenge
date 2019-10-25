require 'pg'

feature 'view the chitter feed' do
  scenario 'the user can view the chitter feed content' do

     connection = PG.connect(dbname: 'chitter_test')

     connection.exec("INSERT INTO feed (content) VALUES ('This is message by Luke');")
     connection.exec("INSERT INTO feed (content) VALUES ('This is another message by Steve');")
     connection.exec("INSERT INTO feed (content) VALUES ('This is the Chitter Challenge');")

     visit '/'

     expect(page).to have_content('This is message by Luke')
     expect(page).to have_content('This is another message by Steve')
     expect(page).to have_content('This is the Chitter Challenge')

  end
end
