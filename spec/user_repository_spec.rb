require 'user'
require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_users_table
    end

    it 'checks if the email is in use' do
        repo = UserRepository.new
        found_user = repo.find('mike@strangerthings.com')

        if found_user.nil?
        else
        expect(found_user.name).to eq 'Mike Wheeler'
        expect(found_user.username).to eq 'D&D'
        expect(found_user.email).to eq 'mike@strangerthings.com'
        end
    end
    it 'checks if username exists' do 
        repo = UserRepository.new
        found_username = repo.find('Demogorgan')
        
        if found_username.nil?
        else

        expect(found_username.id).to eq 3
        expect(found_username.name).to eq 'Dustin Henderson'
        expect(found_username.username).to eq 'Demogorgan'
        expect(found_username.email).to eq 'dustin@strangerthings.com'
        end
    end
    it 'creates a new user' do
        repo = UserRepository.new
        new_user = User.new

        new_user.name = 'Max Mayfield'
        new_user.username = 'MadMax'
        new_user.email = 'max@strangerthings.com'
        new_user.password = 'KateBush1'

        repo.create(new_user)

        expect(new_user.name).to eq 'Max Mayfield'
        expect(new_user.username).to eq 'MadMax'
        expect(new_user.email).to eq 'max@strangerthings.com'
        expect(new_user.password).to eq 'KateBush1'
    end
    it "creates a new user, which is returned when the find method is called" do
        repo = UserRepository.new
        new_user = User.new

        new_user.name = 'Max Mayfield'
        new_user.username = 'MadMax'
        new_user.email = 'max@strangerthings.com'
        new_user.password = 'KateBush1'

        repo.create(new_user)
    
        found_user = repo.find('max@strangerthings.com')
        expect(found_user.id).to eq 7
        expect(found_user.name).to eq 'Max Mayfield'
        expect(found_user.username).to eq 'MadMax'
        expect(found_user.email).to eq 'max@strangerthings.com'
        expect(found_user.password).to eq 'KateBush1'
    end
end