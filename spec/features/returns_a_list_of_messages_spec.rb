feature 'Returning messages' do
    scenario 'A user can see all messages in a view' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO users VALUES(1, 'Kanye', 'kanye', 'kanyewest@gmail.com', 'password123');")
        connection.exec("INSERT INTO users VALUES(2, 'Kendrick', 'kendrick', 'kendrick@gmail.com', 'password456');")
        connection.exec("INSERT INTO users VALUES(3, 'Jay Z', 'jayz', 'jayz@gmail.com', 'password789');")

        connection.exec("INSERT INTO messages VALUES(1, 1, 'Jesus is King is now out', '13:00:00.0000000');")
        connection.exec("INSERT INTO messages VALUES(2, 1, 'Do not listen to it', '13:10:00.0000000');")
        connection.exec("INSERT INTO messages VALUES(3, 2, 'TDE tour soon', '13:20:00.0000000');")

        visit('/messages')

        expect(page).to have_content('Jesus is King is now out')
        expect(page).to have_content('Do not listen to it')
        expect(page).to have_content('TDE tour soon')
    end
end