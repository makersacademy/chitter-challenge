require 'bcrypt'
require 'user_repo'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  it "finds a user" do
    repo = UserRepository.new
    saved_user = repo.find_by_email('duck@makers.com')
    expect(saved_user['id']).to eq('1')
    expect(saved_user['email']).to eq('duck@makers.com')
    expect(saved_user['password']).to eq('quack!')
  end

  it "creates a user" do
    new_user = { email: 'billy@silly.com', password: 'rubbish' }
    b_crypt = double :bcrypt
    expect(b_crypt).to receive(:create).with('rubbish').and_return('encrypted')
    repo = UserRepository.new(b_crypt)
    repo.create(new_user)
    
    billy = repo.find_by_email('billy@silly.com')
    expect(billy['id']).to eq('2')
    expect(billy['email']).to eq('billy@silly.com')
    expect(billy['password']).to eq('encrypted')
  end

  it "logs in" do
    new_user = { email: 'billy@silly.com', password: 'rubbish' }
    repo = UserRepository.new
    repo.create(new_user)
    result = repo.sign_in(new_user[:email], 'rubbish')
    result2 = repo.sign_in(new_user[:email], 'wrong_password')
    expect(result).to eq("success")
    expect(result2).to eq("fail")
  end
end
