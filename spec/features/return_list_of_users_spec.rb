feature 'Return list of users' do
    scenario 'Return the name of users in a view' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO users VALUES(1, 'Kanye', 'kanye', 'kanyewest@gmail.com', 'password123');")
        connection.exec("INSERT INTO users VALUES(2, 'Kendrick', 'kendrick', 'kendrick@gmail.com', 'password456');")
        connection.exec("INSERT INTO users VALUES(3, 'Jay Z', 'jayz', 'jayz@gmail.com', 'password789');")

        visit('/users')

        expect(page).to have_content 'Kanye'
        expect(page).to have_content 'Kendrick'
        expect(page).to have_content 'Jay Z'
    end
end