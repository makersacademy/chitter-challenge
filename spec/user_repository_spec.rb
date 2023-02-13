require 'user'
require 'user_repository'
require 'database_connection'

def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_app_test' })
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
    expect(users.first.id).to eq "1"
    expect(users.first.name).to eq "Janet Blane"
    expect(users.first.email).to eq "janet11@gmail.com"
    expect(users.first.username).to eq "janet11"
    expect(users.first.password).to eq "password"
  end 

  context 'returns a single user' do 
    it 'returns a single user with id 1' do 
      repo = UserRepository.new 

      user = repo.find(1)

      expect(user.name).to eq "Janet Blane"
      expect(user.email).to eq "janet11@gmail.com"
      expect(user.username).to eq "janet11"
      expect(user.password).to eq "password"
    end 

    it 'returns a single user with id 3' do 
      repo = UserRepository.new 

      user = repo.find(3)

      expect(user.name).to eq "Ray Holt"
      expect(user.email).to eq "raymondholt@gmail.com"
      expect(user.username).to eq "ray_holt"
      expect(user.password).to eq "cheddar007"
    end
  end 

  it 'creates a new user' do 
    repo = UserRepository.new

    user = User.new
    user.name = 'Jake Peralta'
    user.email = 'jakeyboi2000@gmail.com'
    user.username = 'jakeyboi2000'
    user.password = 'brooklyn99'
    
    repo.create(user)

    users = repo.all
    last_user = users.last

    expect(last_user.name).to eq 'Jake Peralta'
    expect(last_user.email).to eq 'jakeyboi2000@gmail.com'
    expect(last_user.username).to eq 'jakeyboi2000'
    expect(last_user.password).to eq 'brooklyn99'
  end

   


end 