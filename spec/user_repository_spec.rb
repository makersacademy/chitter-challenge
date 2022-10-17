require 'user_repository'

def reset_user_table
  seed_sql = File.read('spec/seeds/posts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_user_table
  end

  context "see all users" do
    it "returns all the users" do
      repo = UserRepository.new

      users = repo.all

      expect(users.length).to eq 3
      expect(users.first.username).to eq "harry_styles"
      expect(users.first.email).to eq "harry_styles@email.co.uk"
    end
  end

  context "create new user" do
    it "returns all the users with the new user" do
      repo = UserRepository.new

      user = User.new
      user.username = 'sabrina_carpenter'
      user.email = 'sabrina_carpenter@email.com'
      user.password = 'emails'

      repo.create(user)

      users = repo.all

      expect(users.length).to eq 4
      expect(users.last.username).to eq 'sabrina_carpenter'
      expect(users.last.email).to eq 'sabrina_carpenter@email.com'
    end
  end

  context "find by email" do
    it "returns the user" do
      repo = UserRepository.new

      user = repo.find_by_email('taylor_swift@email.com')

      expect(user.id).to eq 2
      expect(user.username).to eq 'taylor_swift'
    end
  end

  context "sign in" do
    it "signs in successfully" do
      repo = UserRepository.new

      user = User.new
      user.username = 'sabrina_carpenter'
      user.email = 'sabrina_carpenter@email.com'
      user.password = 'emails'

      repo.create(user)

      signed_in = repo.sign_in('sabrina_carpenter@email.com', 'emails')

      expect(signed_in).to eq true
    end

    it "fails to signs in" do
      repo = UserRepository.new

      user = User.new
      user.username = 'sabrina_carpenter'
      user.email = 'sabrina_carpenter@email.com'
      user.password = 'emails'

      repo.create(user)

      signed_in = repo.sign_in('sabrina_carpenter@email.com', 'hi')

      expect(signed_in).to eq false
    end
  end
end
