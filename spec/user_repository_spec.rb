require 'user'
require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds/user_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
end

describe UserRepository do
    before(:each) do
        reset_users_table
    end

    it "returns all users" do
        repo = UserRepository.new
        result = repo.all
        expect(result.length).to eq 3
    end

    it "creates a user" do
        repo = UserRepository.new
        new_user = User.new
        new_user.name = 'Bruce Banner'
        new_user.username = 'Hulk'
        new_user.email = 'hulk@makersacademy.com'
        new_user.password = '12345678('
        repo.create(new_user)
        result = repo.all
        expect(result.last.name).to eq('Bruce Banner')
    end

end