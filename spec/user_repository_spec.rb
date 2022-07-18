require 'user_repository'
require 'bcrypt'

def reset_tables
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
  
describe UserRepository do
    before(:each) do 
        reset_tables
    end

    it "returns all users" do
        repo = UserRepository.new
        all_users = repo.all
        expect(all_users[0].name).to eq 'Irina'
        expect(all_users[0].email).to eq 'irina@email.com'
    end

    it 'creates a new user' do
        repo = UserRepository.new
        user = User.new
        user.name = 'Test'
        user.email = 'test@email.com'
        user.password = '12345'

        repo.create(user)

        last_user = repo.all.last
        expect(last_user.name).to eq "Test"
        expect(last_user.email).to eq "test@email.com"
        expect(BCrypt::Password.new(last_user.password)).to eq user.password
    end

    it "finds a user by email" do
        repo = UserRepository.new
        user = repo.find_by_email('irina@email.com')
        expect(user.name).to eq 'Irina'
    end

    it "returns an empty list if an email doesn't exist" do
        repo = UserRepository.new
        user = repo.find_by_email('something@email.com')
        expect(user).to eq nil
    end

    it 'returns login successful when the password is correct' do
        repo = UserRepository.new
        user = User.new
        user.name = 'Test'
        user.email = 'test@email.com'
        user.password = '12345'

        repo.create(user)
        expect(repo.sign_in('test@email.com','12345')).to eq true
    end

    #
    it "returns nil if the user doesn't exist" do
        repo = UserRepository.new
        signin = repo.sign_in("fgdhdj", 'fsjfhsjdhf')
        expect(signin).to eq nil
    end

end