require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  if ENV["PG_password"] 
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', password: ENV["PG_password"] })
  else
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  end
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
  # 1
# Get all users
context "all method" do
  it "Get all users" do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq '1'
    expect(users[0].name).to eq 'David'
    expect(users[0].email).to eq 'david@mail.com'

    expect(users[1].id).to eq '2'
    expect(users[1].name).to eq 'Anna'
    expect(users[1].email).to eq 'anna@mail.com'
  end
end

  # 2
# create a single user
  context "create method" do
    it "creat a single user" do
      repo = UserRepository.new

      user = User.new
      user.email = 'harry@mail.com'
      user.password = '123'
      user.name = 'Harry'
      user.username = 'superharry'

      repo.create(user)

      users = repo.all

      last_user = users.last
      expect(last_user.name).to eq 'Harry'
      expect(last_user.email).to eq 'harry@mail.com'
    end
    
    # 3
# Get an error if create an exist username 
    it "Get an error if create an exist username" do
      repo = UserRepository.new

      user = User.new
      user.email = 'david02@mail.com'
      user.password = '123'
      user.name = 'David02'
      user.username = 'superdavid'

      expect{repo.create(user)}.to raise_error PG::UniqueViolation
    end

    # 4
# Get an error if create an exist email address 
    it "Get an error if create an exist email address" do
      repo = UserRepository.new

      user = User.new
      user.email = 'david@mail.com'
      user.password = '123'
      user.name = 'David02'
      user.username = 'superdavid02'

      expect{repo.create(user)}.to raise_error PG::UniqueViolation
    end

        # 5
# Get an error if email null
    it "Get an error if email null" do
      repo = UserRepository.new

      user = User.new
      user.email = nil
      user.password = '123'
      user.name = 'David02'
      user.username = 'superdavid02'

      expect{repo.create(user)}.to raise_error PG::NotNullViolation
    end
  end
end