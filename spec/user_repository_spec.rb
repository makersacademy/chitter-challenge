require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
    
describe UserRepository do
    before(:each) do 
        reset_users_table
    end

    it 'gets all users' do
        repo = UserRepository.new
        users = repo.all
        expect(users.length).to eq 2
        expect(users.first.username).to eq 'MrGood92'
        expect(users.last.name).to eq 'Karen Evil'
    end

    it "gets one user from id" do
        repo = UserRepository.new
        user = repo.find(2)
        expect(user.username).to eq 'DrEvil59'
        user = repo.find(1)
        expect(user.name).to eq 'John Good'
    end

    it 'adds new user' do
        repo = UserRepository.new
        user = User.new
        user.email = 'mantasvolkas@gmail.com'
        user.password = 'TestPassword'
        user.name = 'Mantas Volkauskas'
        user.username = 'TheRealMannyV'
        repo.create(user)
        
        users = repo.all
        expect(users.length).to eq 3
        expect(users.last.username).to eq 'TheRealMannyV'
    end

    it "gets one users encrypted password from email" do
        repo = UserRepository.new
        user = repo.find_by_email('DrEvil59@email.com')
        expect(user.password).to eq 'TestPassword'
    end
end