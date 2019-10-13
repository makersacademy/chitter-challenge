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

    describe '.log in' do
        it 'user can login' do
            id = DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test') RETURNING id;").first['id']
            user = User.login(user_name: 'test', password: 'test')
            expect(user.id).to eq id
        end
        it 'user cannot login if details are wrong' do
            id = DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test') RETURNING id;").first['id']
            user = User.login(user_name: 'test', password: 'tst')
            expect(User.logged_in).to be nil
        end
    end

    describe '.log out' do
        it 'user can logout' do
            user = User.create(user_name: 'test', email: 'test@test.com', password: 'test')
            expect(User.logged_in).not_to be nil
            User.logout
            expect(User.logged_in).to be nil
        end
    end

end