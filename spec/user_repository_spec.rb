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
      expect(users.first.password).to eq ('StrongPassword123!!')
      expect(users.first.name).to eq ('Sarah Jacobs')
      expect(users.first.username).to eq ('JazzySaz')
      expect(users.last.id).to eq ('3')
      expect(users.last.email_address).to eq ('lewisjandrews@outlook.com')
      expect(users.last.password).to eq ('Norfolk?91')
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
      expect(users.last.password).to eq ('NewPassword')
      expect(users.last.name).to eq ('New Name')
      expect(users.last.username).to eq ('new_username')
    end

    xit "raises error when a field is empty" do
      new_user = User.new
      new_user.email_address = 'newuser@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = ''
      
      repo = UserRepository.new
      expect{ repo.create(new_user) }.to raise_error ('Please fill in all fields')
    end

    xit "raises error when email_address is already taken" do
      new_user = User.new
      new_user.email_address = 'sarahjacobs@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = 'new_username'
      
      repo = UserRepository.new
      expect{ repo.create(new_user) }.to raise_error ('That email address is already taken')
    end

    xit "raises error when username is already taken" do
      new_user = User.new
      new_user.email_address = 'newuser@gmail.com'
      new_user.password = 'NewPassword'
      new_user.name = 'New Name'
      new_user.username = 'JJ22'
      
      repo = UserRepository.new
      expect{ repo.create(new_user) }.to raise_error ('That username is already taken')
    end
  end

  describe "#find_user_by_id(user_id)" do
    it "returns the user object for the given id" do
      repo = UserRepository.new
      user = repo.find_user_by_id(2)

      expect(user.id).to eq ("2")
      expect(user.email_address).to eq ("johnny22@gmail.com")
      expect(user.password).to eq ("22pwordjj")
      expect(user.name).to eq ("Johnny James")
      expect(user.username).to eq ("JJ22")
    end

    xit "raises an error if user doesn't exist" do
      repo = UserRepository.new
      expect{ repo.find_user_by_id(100) }.to raise_error ("No user exists at this address")
    end
  end

  describe "#find_user_by_email(email_address)" do
    it "returns the info of user with given email_address" do
      repo = UserRepository.new
      user = repo.find_user_by_email("johnny22@gmail.com")

      expect(user.id).to eq ("2")
      expect(user.email_address).to eq ("johnny22@gmail.com")
      expect(user.password).to eq ("22pwordjj")
      expect(user.name).to eq ("Johnny James")
      expect(user.username).to eq ("JJ22")
    end

    it "returns nil if no user with that email address exists" do
      repo = UserRepository.new
      expect(repo.find_user_by_email("invalid@gmail.com")).to eq (nil)
    end
  end
end