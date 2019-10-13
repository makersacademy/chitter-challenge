require 'user'

describe User do

    describe '.create' do
        it 'creates a user and saves to the database' do
            User.create(user_name: 'test', email: 'test@test.com', password: 'test')
            user = DatabaseConnection.query('SELECT * FROM users;').first
            expect(user['user_name']).to eq 'test'
        end

        it 'returns error if email is already in use' do
            User.create(user_name: 'test', email: 'test@test.com', password: 'test')
            User.create(user_name: 'test2', email: 'test@test.com', password: 'test')
            expect(User.error).to eq 'email'
        end

        it 'returns error if username is already in use' do
            User.create(user_name: 'test', email: 'test@test.com', password: 'test')
            User.create(user_name: 'test', email: 'test2@test.com', password: 'test')
            expect(User.error).to eq 'user_name'
        end
    end

    # describe '.log in' do
    #     it 'user can login' do
    #         User.create(user_name: 'test', email: 'test@test.com', password: 'test')
    #         user = DatabaseConnection.query('SELECT * FROM users;').first
    #         expect(user['user_name']).to eq 'test'
    #     end
    # end

    # describe '.log out' do
    #     it 'user can logout' do
    #         User.create(user_name: 'test', email: 'test@test.com', password: 'test')
    #         user = DatabaseConnection.query('SELECT * FROM users;').first
    #         expect(user['user_name']).to eq 'test'
    #     end
    # end

end