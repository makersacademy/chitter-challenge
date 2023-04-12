require "user_repository"

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect(host: '127.0.0.1', dbname: 'chitter_test')
  connection.exec(seed_sql)
end

describe UserRepository do
  before :each do
    reset_tables
  end

  let(:repo) { UserRepository.new }

  context "when searching by username" do
    it "returns the user" do
      user = repo.find_by_username('tcarmichael')
      expect(user).to be_truthy
      expect(user.password).to eq "password123"
      expect(user.name).to eq "Tom Carmichael-Mhanna"
      expect(user.email).to eq "tomcarmichael@hotmail.co.uk"
    end
    it "returns nil if user not found" do
      user = repo.find_by_username('jay_dilla')
      expect(user).not_to be_truthy
    end
  end

  let(:user) {
    user = User.new
    user.name = "John Smith"
    user.username = "jsmith"
    user.email = "john@smith.com"
    user.password = "JS123"
    return user
  }

  context "when creating a new user" do
    it "adds the user to the DB and returns nil" do
      expect(repo.create(user)).to be_nil
      expect(repo.all.length).to eq 4
      expect(repo.all.last.name).to eq "John Smith"
      expect(repo.all.last.email).to eq "john@smith.com"
    end
    xit "fails to add them given any missing info" do
      #TODO? 
    end
    it "stores their password using the BCrypt hashing algorithm" do
      repo.create(user)
      added_user = repo.all.last
      stored_password = BCrypt::Password.new(added_user.password)
      expect(stored_password).to eq "JS123"
    end
  end

  context "when attempting to sign in" do
    it "returns a hash indicating failure & reason if the username does not exist" do 
      expect(repo.login('jazzy_jeff', 'fresh')).to eq({ success: false, reason: "invalid username "})
    end
    it "returns a hash indicating success and the the username & ID if credentials are correct" do
      repo.create(user)
      login_attempt = repo.login('jsmith', "JS123")
      expect(login_attempt).to eq({ success: true, username: "jsmith", user_id: 4 })
    end
    it "returns a hash indicating success and the the username & ID if credentials are correct" do
      login_attempt = repo.login('wsmith', "bigbrother")
      expect(login_attempt).to eq({ success: true, username: "wsmith", user_id: 3 })
    end

    it "returns a hash inidcating failure and reason if password is not correct" do
      repo.create(user)
      expect(repo.login('jsmith', 'js123')).to eq({ success: false, reason: "incorrect password "}) 
    end
  end  
end