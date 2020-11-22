feature 'Viewing peeps' do
    scenario 'A Maker can view peeps' do
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO peeps (content) VALUES ('First database table peep!')")
        connection.exec("INSERT INTO peeps (content) VALUES ('Peep peep')")
        connection.exec("INSERT INTO peeps (content) VALUES ('Chitter chatter')")

        visit('/peeps')

        expect(page).to have_content('First database table peep!')
        expect(page).to have_content('Peep peep')
        expect(page).to have_content('Chitter chatter')
    end
end