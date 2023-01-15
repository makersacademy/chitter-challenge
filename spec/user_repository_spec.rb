require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
    connection = PG.connect({host: '127.0.0.1', dbname: 'chitter_test'})
    connection.exec(seed_sql)
end

describe UserRepository do
    before(:each) do
        reset_users_table
    end

    it 'returns all users' do
        repo = UserRepository.new
        users = repo.all
        expect(users.length).to eq 2
        expect(users.first.username).to eq 'datboi'
        expect(users.last.name).to eq 'Rob Robinson'
    end

    it 'finds a user by id' do
        repo = UserRepository.new
        user = repo.find(2)
        expect(user.username).to eq 'robrobinson'
        user = repo.find(1)
        expect(user.name).to eq 'Dat Boi'
    end

    it 'creates a new user' do
        repo = UserRepository.new
        user = User.new
        user.email = 'ry.mchugh@outlook.com'
        user.password = 'password'
        user.name = 'Ryan McHugh'
        user.username = 'rymchugh'
        repo.create(user)
        users = repo.all
        expect(users.length).to eq 3
        expect(users.last.username).to eq 'rymchugh'
    end

    it 'retrieves users encrypted password from email' do
        repo = UserRepository.new
        user = repo.find_by_email('mr_robinson@thisemail.com')
        expect(user.password).to eq 'somepassword'
    end
end