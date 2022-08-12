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

  context "find_by_email" do
    it "finds a user" do
      repo = UserRepository.new
      saved_user = repo.find_by_email('duck@makers.com')
      expect(saved_user['id']).to eq('1')
      expect(saved_user['email']).to eq('duck@makers.com')
      expect(saved_user['password']).to eq('quack!')
    end

    it "fail" do
      repo = UserRepository.new
      expect { repo.find_by_email('ducks@makers.com') }.to raise_error("user not found")
    end
  end

  context "create" do
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

    it "fail" do
      new_user = { email: 'billy@silly.com', password: '' }
      b_crypt = double :bcrypt
      repo = UserRepository.new(b_crypt)
      expect { repo.create(new_user) }.to raise_error("no password")
    end

    it "fail" do
      new_user = { password: '' }
      b_crypt = double :bcrypt
      repo = UserRepository.new(b_crypt)
      expect { repo.create(new_user) }.to raise_error("no email")
    end
  end

  context "login" do
    it "logs in" do
      new_user = { email: 'billy@silly.com', password: 'rubbish' }
      repo = UserRepository.new
      repo.create(new_user)
      result = repo.sign_in(new_user[:email], 'rubbish')
      result2 = repo.sign_in(new_user[:email], 'wrong_password')
      expect(result).to eq(true)
      expect(result2).to eq(false)
    end

    it "no password" do
      new_user = { email: 'billy@silly.com', password: 'rubbish' }
      repo = UserRepository.new
      repo.create(new_user)
      result = repo.sign_in(new_user[:email], '')
      expect(result).to eq(false)
    end

    it "blank email" do
      new_user = { email: 'billy@silly.com', password: 'rubbish' }
      repo = UserRepository.new
      repo.create(new_user)
      expect { repo.sign_in('', 'rubbish') }.to raise_error "user not found"
    end
  end
end
