require 'user_repository'


def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  
  before(:each) do 
    reset_tables
  end

  describe "#all" do
    it "returns all info of all users" do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq (3)
      expect(users.first.id).to eq ('1')
      expect(users.first.email_address).to eq ('sarahjacobs@gmail.com')
      expect(users.first.password).to eq (BCrypt::Password.new(users.first.password))
      expect(users.first.name).to eq ('Sarah Jacobs')
      expect(users.first.username).to eq ('JazzySaz')
      expect(users.last.id).to eq ('3')
      expect(users.last.email_address).to eq ('lewisjandrews@outlook.com')
      expect(users.last.password).to eq (BCrypt::Password.new(users.last.password))
      expect(users.last.name).to eq ('Lewis Andrews')
      expect(users.last.username).to eq ('Luigi_100')
    end
  end

  describe "#create(user)" do
    it "adds a new user to dataset" do
      new_user = User.new
      new_user.email_address = 'newuser@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(new_user)
      
      users = repo.all
      
      expect(users.last.id).to eq ('4')
      expect(users.last.email_address).to eq ('newuser@gmail.com')
      expect(users.last.password).to eq (BCrypt::Password.new(users.last.password))
      expect(users.last.name).to eq ('New Name')
      expect(users.last.username).to eq ('new_username')
    end
  end

  describe "#find_user_by_id(user_id)" do
    it "returns the user object for the given id" do
      repo = UserRepository.new
      user = repo.find_user_by_id(2)

      expect(user.id).to eq ("2")
      expect(user.email_address).to eq ("johnny22@gmail.com")
      expect(user.password).to eq (BCrypt::Password.new(user.password))
      expect(user.name).to eq ("Johnny James")
      expect(user.username).to eq ("JJ22")
    end
  end

  describe "#find_user_by_email(email_address)" do
    it "returns the info of user with given email_address" do
      repo = UserRepository.new
      user = repo.find_user_by_email("johnny22@gmail.com")

      expect(user.id).to eq ("2")
      expect(user.email_address).to eq ("johnny22@gmail.com")
      expect(user.password).to eq (BCrypt::Password.new(user.password))
      expect(user.name).to eq ("Johnny James")
      expect(user.username).to eq ("JJ22")
    end

    it "returns nil if no user with that email address exists" do
      repo = UserRepository.new
      expect(repo.find_user_by_email("invalid@gmail.com")).to eq (nil)
    end
  end

  describe "record_into_user(record)" do
    it "takes a record and turns in into a User" do
      repo = UserRepository.new
      sql = "SELECT id, email_address, password, name, username FROM users WHERE email_address = $1"
      params = ["sarahjacobs@gmail.com"]
      result_set = DatabaseConnection.exec_params(sql, params)
      record = result_set[0]
      user = repo.record_into_user(record)

      expect(user.id).to eq ("1")
      expect(user.email_address).to eq ("sarahjacobs@gmail.com")
      expect(user.password).to eq (BCrypt::Password.new(user.password))
      expect(user.name).to eq ("Sarah Jacobs")
      expect(user.username).to eq ("JazzySaz")
    end
  end
end