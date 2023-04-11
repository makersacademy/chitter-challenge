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
      expect(users.first.password).to eq "$2a$12$79o3wBPYwLiNGnS329LQJOV91pzp4RXaQi1KXPShy7bg6hBD1t3LO"
      expect(users[2].password).to eq "$2a$12$a/Sg0TiHT7uXxsr4oWDfFu5DEzJrTDSPqkie3v3iYDcKOXb7D07j6"
    end
  end

  context "#create" do
    it "makes a new user" do
      repo = UserRepository.new
      new_user = User.new
      new_user.name = "Demi Quart"
      new_user.username = "Demi"
      new_user.email = "demi@email.com"
      new_user.password = "MyPassword13"
      repo.create(new_user)
      users = repo.all
      expect(users.length).to eq 4
      expect(users.last.name).to eq "Demi Quart"
      expect(users.last.username).to eq "Demi"
      expect(users.last.email).to eq 'demi@email.com'
    end
  end

  context "#find_by_email" do
    it "returns a single user based on the email argument passed in #1" do
      repo = UserRepository.new
      user = repo.find_by_email("billy@email.com")
      expect(user.name).to eq "Billy Thompkins"
      expect(user.username).to eq "Billy"
      expect(user.email).to eq 'billy@email.com'
      expect(user.password).to eq "$2a$12$KuowH.RWU8/Hx7u1uNJAzOYEABy2APD9v4lrAGn5UxK9mhdXGSpXm"
    end

    it "returns a single user based on the email argument passed in #2" do
      repo = UserRepository.new
      user = repo.find_by_email("caleb@email.com")
      expect(user.name).to eq "Caleb Tomlinson"
      expect(user.username).to eq "Caleb"
      expect(user.email).to eq 'caleb@email.com'
      expect(user.password).to eq "$2a$12$a/Sg0TiHT7uXxsr4oWDfFu5DEzJrTDSPqkie3v3iYDcKOXb7D07j6"
    end
  end

  context "#all_usernames" do
    it "returns all User objects" do
      repo = UserRepository.new
      users = repo.all_usernames
      expect(users.length).to eq 3
      expect(users.first).to eq "Amber"
      expect(users[1]).to eq "Billy"
      expect(users.last).to eq "Caleb"
    end
  end

  context "#all_emails" do
    it "returns all User objects" do
      repo = UserRepository.new
      users = repo.all_emails
      expect(users.length).to eq 3
      expect(users.first).to eq "amber@email.com"
      expect(users[1]).to eq "billy@email.com"
      expect(users.last).to eq "caleb@email.com"
    end
  end

end