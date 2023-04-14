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
      expect(user.name).to eq "Tom Carmichael-Mhanna"
      expect(user.email).to eq "tomcarmichael@hotmail.co.uk"
    end
    it "returns nil if user not found" do
      user = repo.find_by_username('jay_dilla')
      expect(user).not_to be_truthy
    end
  end

  context "when searching by email" do
    it "returns the user" do
      user = repo.find_by_email('tomcarmichael@hotmail.co.uk')
      expect(user).to be_truthy
      expect(user.name).to eq "Tom Carmichael-Mhanna"
      expect(user.username).to eq "tcarmichael"
    end
  end

  let(:register_user) {
    repo = UserRepository.new
    username = "jsmith"
    name = "John Smith"
    email = "john@smith.com"
    password = "JS123"
    repo.register(username, name, email, password)
  }

  context "when creating a new user" do
    it "adds the user to the DB and indicates success" do
      expect(register_user).to eq({ success?: true })
      expect(repo.all.length).to eq 4
      expect(repo.all.last.name).to eq "John Smith"
      expect(repo.all.last.email).to eq "john@smith.com"
    end
    it "stores their password using the BCrypt hashing algorithm" do
      register_user
      added_user = repo.all.last
      stored_password = BCrypt::Password.new(added_user.password)
      expect(stored_password).to eq "JS123"
    end

    context "if the username already exists" do
      it "indicates failure reason & doesn't add the user to the DB" do
        registration = UserRepository.new.register("tcarmichael", "name", "email@email.com", "password")
        expect(registration).to eq({ success?: false, failure_reason: "username is already taken" })
        expect(repo.all.length).to eq 3
        expect(repo.all.last.name).to eq "Winston Smith"
      end
    end

    context "if the email already exists" do
      it "indicates failure reason & doesn't add the user to the DB" do
        registration = UserRepository.new.register("username", "name", "tomcarmichael@hotmail.co.uk", "password")
        expect(registration).to eq({ success?: false, failure_reason: "email is already taken" })
        expect(repo.all.length).to eq 3
        expect(repo.all.last.name).to eq "Winston Smith"
      end
    end
  end

  context "when attempting to sign in w incorrect username" do
    it "indicates failure" do 
      expect(repo.login('jazzy_jeff', 'fresh')).to eq({ success?: false, failure_reason: "invalid username" })
    end
  end 

  context "when attempting to sign in w incorrect password" do
    it "indicates failure" do
      register_user
      expect(repo.login('jsmith', 'js123')).to eq({ success?: false, failure_reason: "incorrect password" }) 
    end
  end

  context "when attempting to sign in w correct credentials" do
    it "indicates success & returns username and ID" do
      register_user
      login_attempt = repo.login('jsmith', "JS123")
      expect(login_attempt).to eq({ success?: true, username: "jsmith", user_id: 4 })
    end
    it "succeeds for a different user account" do
      login_attempt = repo.login('wsmith', "bigbrother")
      expect(login_attempt).to eq({ success?: true, username: "wsmith", user_id: 3 })
    end
  end

  context "when comparing possible tags with usernames" do
    it "returns an empty array if not given any tags" do
      possible_tags = []
      result = repo.check_for_matching(possible_tags)
      expect(result).to eq([])
    end
    it "returns an empty array if the 1 given tag matches no users" do
      possible_tags = ['@dave']
      result = repo.check_for_matching(possible_tags)
      expect(result).to eq([])
    end
    it "returns an empty array if the given tags match no users" do
      possible_tags = ['@dave', '@clive', '@derek']
      result = repo.check_for_matching(possible_tags)
      expect(result).to eq([])
    end
    it "returns the 1 matching user ID" do
      possible_tags = ['@tcarmichael', '@dave']
      result = repo.check_for_matching(possible_tags)
      expect(result.length).to eq(1)
      expect(result.first).to be_an_instance_of(User)
      expect(result.first.email).to eq("tomcarmichael@hotmail.co.uk")
      expect(result.first.id).to eq(1)
    end
    it "returns the 2 matching user IDs" do
      possible_tags = ['@tcarmichael', '@wsmith']
      result = repo.check_for_matching(possible_tags)
      expect(result.length).to eq(2)
      expect(result.first.id).to eq 1
      expect(result.last.id).to eq 3
      expect(result.last.email).to eq "orwell.george@aol.com"
    end
  end
end
