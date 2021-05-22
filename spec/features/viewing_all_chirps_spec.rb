feature 'Viewing chirps' do
    scenario 'A user can see chirps' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO chirps VALUES (1, 'This is one chirp');")
        connection.exec("INSERT INTO chirps VALUES(2, 'This is another chirp');")
        connection.exec("INSERT INTO chirps VALUES(3, 'This is a totally different chirp');")

        visit('/chirps')
    
        expect(page).to have_content "This is one chirp"
        expect(page).to have_content "This is another chirp"
        expect(page).to have_content "This is a totally different chirp"
    end
end