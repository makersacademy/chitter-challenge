require 'user'
require 'user_repo'

def reset_users_table
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
end
  
describe UserRepository do
    before(:each) do 
      reset_users_table
    end

    it 'Lists all user objects in array' do
        repo = UserRepository.new
        users = repo.all
        expect(users.length).to eq 2
        expect(users.first.username).to eq 'maker52'
        expect(users.last.username).to eq 'iphone49'
        expect(users.first.email).to eq 'abc@gmail.com'
        expect(users.last.email).to eq 'xyz@gmail.com'
        expect(users.first.password).to eq 'abc123'
        expect(users.last.password).to eq 'xyz123'
    end

    it 'creates new a user' do
        repo = UserRepository.new
        
        user = User.new
        user.username = "dave360"
        user.email = "dave@gmail.com"
        user.password = "fgh567"    
        repo.create(user) 

        users = repo.all
        expect(users.length).to eq(3)
        expect(users.last.username).to eq "dave360"
        expect(users.last.email).to eq "dave@gmail.com"
        expect(users.last.password).to eq "fgh567"  
    end         
        

end
