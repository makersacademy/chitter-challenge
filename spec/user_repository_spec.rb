require 'user_repository.rb'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end
  
  context "#all" do
    it "returns all User objects" do
      repo = UserRepository.new
      users = repo.all
      expect(users.length).to eq 3
      expect(users.first.name).to eq "Amber Thompson"
      expect(users.first.username).to eq "Amber"
      expect(users.first.email).to eq 'amber@email.com'
      expect(users.first.password).to eq '123456'
      expect(users[2].password).to eq 'hello'
    end
  end

  context "#create" do
    it "makes a new user" do
      repo = UserRepository.new
      new_user = User.new
      new_user.name = "Demi Quart"
      new_user.username = "Demi"
      new_user.email = "demi@email.com"
      new_user.password = "mypassword"
      repo.create(new_user)
      users = repo.all
      expect(users.length).to eq 4
      expect(users.last.name).to eq "Demi Quart"
      expect(users.last.username).to eq "Demi"
      expect(users.last.email).to eq 'demi@email.com'
      expect(users.last.password).to eq 'mypassword'
    end
  end

end