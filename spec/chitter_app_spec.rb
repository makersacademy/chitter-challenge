require 'chitter.rb'

describe Chitter do
    it 'returns instanc of class' do
        expect(subject).to be_a Chitter
    end

    describe '#return_users' do
        it 'returns a list of users' do
            connection = PG.connect(dbname: 'chitter_test')
            
            connection.exec("INSERT INTO users VALUES(1, 'Kanye', 'kanye', 'kanyewest@gmail.com', 'password123');")
            connection.exec("INSERT INTO users VALUES(2, 'Kendrick', 'kendrick', 'kendrick@gmail.com', 'password456');")
            connection.exec("INSERT INTO users VALUES(3, 'Jay Z', 'jayz', 'jayz@gmail.com', 'password789');")

            users = Chitter.return_users

            expect(users).to include "Kanye"
            expect(users).to include "Kendrick"
            expect(users).to include "Jay Z"
        end
    end
end