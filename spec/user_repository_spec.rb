require 'pg'
require 'user_repository'
require 'user'

def reset_peeps_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter'})
    connection.exec(seed_sql)
end

RSpec.describe UserRepository do

    before (:each) do
        reset_peeps_table
    end

    it 'returns all users' do
        user_repo = UserRepository.new
        allusers = user_repo.all

        expect(allusers.length).to eq 3
        expect(allusers.first.username).to eq "ShortForCasserole"
    end

    it 'returns information on the third user' do
        user_repo = UserRepository.new
        user3 = user_repo.find(3)

        expect(user3.username).to eq "User3"
        expect(user3.id).to eq 3
    end

    it 'creates an user' do
        repo = UserRepository.new
    
        new_user = User.new
        new_user.username = 'UserTheFourth'
        new_user.email_address = 'NewUser@TheFourth.com'
        new_user.password = "MayFourth"
        repo.create(new_user)
    
        allusers = repo.all
    
        expect(allusers.length).to eq(4)
        expect(allusers.last.username).to eq('UserTheFourth')
        expect(allusers.last.id).to eq 4
      end

    end