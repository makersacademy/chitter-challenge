require 'user'
require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_users_table
    end

    it 'finds a user by email' do
        repo = UserRepository.new
        result = repo.find_by_email('layi@live.co.uk')
        expect(result.name).to eq 'Layi'
        expect(result.username).to eq 'Layi88'
    end

    it 'finds a user by id' do
      repo = UserRepository.new
      result = repo.find(2)
      expect(result.name).to eq 'Layi'
      expect(result.username).to eq 'Layi88'
      expect(result.email).to eq 'layi@live.co.uk'
  end

    it 'creates a user' do
        repo = UserRepository.new
        user = User.new
        user.email = 'test@example.com'
        user.name = 'Test'
        user.username = 'Test247'
        user.password = 'password3'

        repo.create(user)

        result = repo.find_by_email('test@example.com')
        expect(result.name).to eq 'Test'
        expect(result.username).to eq 'Test247'
        expect(result.password).to eq 'password3'

    end
    
end