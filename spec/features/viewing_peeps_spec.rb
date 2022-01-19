require 'pg'

feature 'viewing peeps' do
    scenario 'A user can see all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO chitter_messages VALUES (1, 'Test Peep');")
        connection.exec("INSERT INTO chitter_messages VALUES (2, 'Test Peep 2');")

        visit ('/chitter')

        expect(page).to have_content 'Test Peep'
        expect(page).to have_content 'Test Peep 2'

    end
end 
