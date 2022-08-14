require 'user_repository'

def reset_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  before(:each) do 
    reset_table
  end

  it 'finds a user by email' do
    user_repo = UserRepository.new
    user = user_repo.find_by_email('nschlosser@hotmail.com')
    
    expect(user.email).to eq 'nschlosser@hotmail.com'
    expect(user.name).to eq 'Naomi Schlösser'
    expect(user.username).to eq 'nschlosser'
  end

  it 'creates a user' do
    new_user = User.new
    new_user.email = 'FAKE_EMAIL'
    allow(BCrypt::Password).to receive(:create).and_return('FAKE_PASSWORD')
    new_user.name = 'FAKE_NAME'
    new_user.username = 'FAKE_USERNAME'
    
    user_repo = UserRepository.new
    user_repo.create(new_user)
    
    user = user_repo.find_by_email('FAKE_EMAIL')
    expect(user.email).to eq 'FAKE_EMAIL'
    expect(user.password).to eq 'FAKE_PASSWORD'
    expect(user.name).to eq 'FAKE_NAME'
    expect(user.username).to eq 'FAKE_USERNAME'
  end

  # context 'when given an incorrect password' do
  #   it 'returns a new page saying incorrect password' do
  #     user_repo = UserRepository.new
  #     result = user_repo.sign_in('nschlosser@hotmail.com', 'INCORRECT_PASSWORD') 
  #     expect(result).to eq false
  #   end
  # end

  # context 'when given the correct password' do
  #   it 'returns the logged_in_page' do
  #     user_repo = UserRepository.new
  #     result = user_repo.sign_in('nschlosser@hotmail.com', 'ABCD') 
  #     expect(result).to eq true
  #   end
  # end
end