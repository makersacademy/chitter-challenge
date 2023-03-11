require "user_repository"

def reset_users_table
  seed_sql = File.read('spec/seeds_user.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  context "add_user(user) method" do
    it "adds a new user" do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.name = 'Janie Marie'
      user.username = 'JMarie1'
      user.password = 'foo'
      user.email = 'Jmarie2002@example.com'

      repo.add_user(user)
      expect(repo.all.length).to eq 4
    end
  end

  context "find_by_email(email) method" do
    it "finds a user by email" do
      repo = UserRepository.new
      user = repo.find_by_email('johndoe@example.com')

      expect(user.id).to eq 1
      expect(user.name).to eq 'John Doe'
      expect(user.username).to eq 'johndoe'
      expect(user.password).to eq 'password123'
      expect(user.email).to eq 'johndoe@example.com'
    end

    it "returns nil when no user has provided email" do
      repo = UserRepository.new
      user = repo.find_by_email('nonexistant_email@example.com')

      expect(user).to eq nil
    end
  end

  context "sign_in(email, submitted_password) method" do
    it "returns true if submitted password is correct" do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.name = 'Janie Marie'
      user.username = 'JMarie1'
      user.password = 'foo'
      user.email = 'Jmarie2002@example.com'

      repo.add_user(user)
      expect(repo.sign_in('Jmarie2002@example.com', 'foo')).to eq true
    end

    it "false if password is incorrect" do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.name = 'Janie Marie'
      user.username = 'JMarie1'
      user.password = 'foo'
      user.email = 'Jmarie2002@example.com'

      repo.add_user(user)
      expect(repo.sign_in('Jmarie2002@example.com', 'bar')).to eq false
    end
  end

  context "all method" do
    it "returns array of user objects" do
      repo = UserRepository.new

      users = repo.all

      expect(users.length).to eq 3

      expect(users[0].id).to eq 1
      expect(users[0].name).to eq 'John Doe'
      expect(users[0].username).to eq 'johndoe'
      expect(users[0].password).to eq 'password123'
      expect(users[0].email).to eq 'johndoe@example.com'

      expect(users[1].id).to eq 2
      expect(users[1].name).to eq "Jane Smith"
      expect(users[1].username).to eq 'janesmith'
      expect(users[1].password).to eq 'abc123'
      expect(users[1].email).to eq 'janesmith@example.com'
    end
  end
  context "find(id) method" do
    it "finds a user by id" do
      repo = UserRepository.new
      user = repo.find(1)

      expect(user.id).to eq 1
      expect(user.name).to eq 'John Doe'
      expect(user.username).to eq 'johndoe'
      expect(user.password).to eq 'password123'
      expect(user.email).to eq 'johndoe@example.com'
    end
  end

  context "delete(id) method" do
    it "deletes a user" do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.name = 'Janie Marie'
      user.username = 'JMarie1'
      user.password = 'foo'
      user.email = 'Jmarie2002@example.com'

      repo.add_user(user)
      expect(repo.all.length).to eq 4
      repo.delete(4)
      expect(repo.all.length).to eq 3
    end
  end
end

# # 1
# # Get add new user

# repo = UserRepository.new

# user = User.new
# user.id = 4
# user.name = 'Janie Marie'
# user.username = 'JMarie1'
# user.password = 'foo'
# user.email = 'Jmarie2002@example.com'

# repo.add_user(user)

# repo.find(4) # => user

# # 2
# # Get a single user

# repo = UserRepository.new

# user = repo.find(1)

# user.id # => 1
# user.name # => 'John Doe'
# user.username # => 'johndoe'
# user.password # => 'password123'
# user.email # => johndoe@example.com'

# # 3 
# # Authenticate user
# repo = UserRepository.new

# repo.authenticate('johndoe', 'password123') # => true
# repo.authenticate('johndoe', 'password1234') # => false
