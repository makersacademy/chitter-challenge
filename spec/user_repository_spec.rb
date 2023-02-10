require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
    @repo = UserRepository.new
  end

  it 'returns a list of user objects' do
    expect(@repo.all.length).to eq 3 
    expect(@repo.all.first.name).to eq 'Luke'
    expect(@repo.all.last.name).to eq 'Jenny'
  end

  it 'creates a new user object' do
    user = double :user_double, email:'james@gmail.com',password:'1234',name:'James',username:'james'

    @repo.create(user)

    expect(@repo.all.length).to eq 4
    expect(@repo.all.last.name).to eq 'James'
  end

  it 'finds a user object with specific id' do
    user = @repo.find(1) 
    expect(user.id).to eq 1
    expect(user.name).to eq 'Luke'
  end

  it 'checks if a username or email exsits' do
    user_1 = double :user_double, username:'luke',email:'luke@gmail.com'
    user_2 = double :user_double, email:'abc@gmail.com',username:'luke123'
    user_3 = double :user_double, email:'luke@gmail.com',username:'luke123'
    expect(@repo.user_exist?(user_1)).to eq 'Username exists!' 
    expect(@repo.user_exist?(user_2)).to eq 'Email exists!' 
    expect(@repo.user_exist?(user_3)).to eq false
  end

  context 'checks if a email matching a password' do
    it 'matches' do
      result = @repo.check_credential('abc@gmail.com','123')
      expect(result).to eq true
    end
    it 'does not match the email' do
      result = @repo.check_credential('123@gmail.com','123')
      expect(result).to eq false
    end
    it 'does not match the password' do
      result = @repo.check_credential('abc@gmail.com','456')
      expect(result).to eq false
    end
  end
end
