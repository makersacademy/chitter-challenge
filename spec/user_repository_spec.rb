require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_directory_test' })
    connection.exec(seed_sql)
end
  
describe UserRepository do
    before(:each) do 
        reset_users_table
    end

    it 'returns all users' do
        repo = UserRepository.new
        
        users = repo.all
        
        expect(users.length).to eq 3
        
        expect(users[0].id).to eq 1
        expect(users[0].name).to eq 'name 1'
        expect(users[0].username).to eq 'username_1'
        expect(users[0].email).to eq 'test1@email.com'
        
        expect(users[1].id).to eq 2
        expect(users[1].name).to eq 'name 2'
        expect(users[1].username).to eq 'username_2'
        expect(users[1].email).to eq 'test2@email.com'
        
        expect(users[2].id).to eq 3
        expect(users[2].name).to eq 'name 3'
        expect(users[2].username).to eq 'username_3'
        expect(users[2].email).to eq 'test3@email.com'
    end
    
end
