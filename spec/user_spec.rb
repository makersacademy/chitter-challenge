require 'pg'
require 'user'

describe User do
    describe '.create' do
        it 'adds a new user to the database' do
            connection = PG.connect(dbname: 'chitter_test')

            user = User.create(user_id: "user1", name: "Bob", email: "bob@bob.bob", password: "bobisthebob")
            
            persisted_data = connection.exec("SELECT * FROM users WHERE user_id='user1'")

            expect(user).to be_a User
            expect(user.user_id).to eq persisted_data.first['user_id']
            expect(user.name).to eq 'Bob'
            expect(user.email).to eq 'bob@bob.bob'
            expect(user.password).to eq 'bobisthebob'
        end
    end
end