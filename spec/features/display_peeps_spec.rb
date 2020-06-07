require 'pg'

feature 'homepage displays all the peeps' do
    scenario 'a user is displayed a page with all the peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO peep_manager (peep) VALUES( 'hello world');")
        visit('/')

        expect(page).to have_content "hello world"
    end
end