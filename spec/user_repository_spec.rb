require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  it 'returns all users' do 
    repo = UserRepository.new
    users = repo.all
    
    expect(users.length).to eq 4
    
    expect(users[0].username).to eq 'Bloggy_J'
    expect(users[0].email_address).to eq 'joe_blogs@gmail.com'
    expect(users[0].password).to eq 'sxdfhcgjvhk2342'
    expect(users[0].full_name).to eq 'Joe_Bloggs'
    
    expect(users[1].username).to eq'The_Migster'
    expect(users[1].email_address).to eq'm_miggins@hotmail.com'
    expect(users[1].password).to eq '&gfdklwr3'
    expect(users[1].full_name).to eq 'Mrs_Miggins'
  end 

  context 'finds a specific user by email address' do 

    it 'finds the last user' do

      repo = UserRepository.new

      user = repo.find_by_email('Meelon@tesla.com')
      
      expect(user.id).to eq '4'
      expect(user.username).to eq 'not_elon'
      expect(user.email_address).to eq 'Meelon@tesla.com'
      expect(user.password).to eq '1filNfdvc£'
      expect(user.full_name).to eq 'Meelon Musk'

    end 

    it 'returns the 2nd user' do

      repo = UserRepository.new

      user = repo.find_by_email('m_miggins@hotmail.com')

      expect(user.id).to eq '2'
      expect(user.username).to eq 'The_Migster'
      expect(user.email_address).to eq 'm_miggins@hotmail.com'
      expect(user.password).to eq '&gfdklwr3'
      expect(user.full_name ).to eq 'Mrs_Miggins'
    end 

  end 

it 'creates a new user' do 

    repo = UserRepository.new
    user = User.new
    
    user.username = 'new_user'
    user.email_address = 'new_user@gmail.com'
    user.password = '123abc&%_'
    user.full_name = 'New User'

    repo.create(user)
    
    users = repo.all
    
    expect(users.length).to eq 5 
    
    expect(users.last.username).to eq 'new_user'
    expect(users.last.email_address).to eq 'new_user@gmail.com'
    expect(users.last.password).to eq '123abc&%_'
    expect(users.last.full_name).to eq 'New User'

  end 

end