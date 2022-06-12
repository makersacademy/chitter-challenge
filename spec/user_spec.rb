require 'pg'

describe User do
  describe ".all" do
    it "displays all users of Chitter" do
      sophie = User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")
      persisted_data = DatabaseConnection.query("SELECT * FROM users WHERE id = #{sophie.id};")
      User.create(first_name: "Joe", last_name: "Gilder", email: "joe@gmail.com", handle: "joeg", password: "999woopyeah")

      expect(User.all.size).to eq 2
      expect(User.all.first.first_name).to eq "Sophie"
      expect(User.all.first.last_name).to eq "Gilder"
      expect(User.all.first.email).to eq "test@gmail.com"
      expect(User.all.first.handle).to eq "sophieg"
      expect(User.all.first.id).to eq persisted_data.first['id']
    end
  end

  describe ".create" do
    it "adds a new user to the database" do
      sophie = User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")
      expect(User.all.first.first_name).to eq "Sophie"
    end

    it "hashs the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("password123")
      User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")
    end
  end

  describe ".find" do
    it "finds the user based on the id stored in the session" do
    sophie = User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")
    result = User.find(id: sophie.id)
    expect(result.id).to eq sophie.id
    expect(result.first_name).to eq "Sophie"
    end 

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user and logs them in if correct email and password are given' do
      sophie = User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")
      authenticated_user = User.authenticate(email: 'test@gmail.com', password: 'password123')
      expect(authenticated_user.id).to eq sophie.id
    end

    it "returns nil if incorrect email given" do
      sophie = User.create(first_name: "Sophie", last_name: "Gilder", email: "test@gmail.com", handle: "sophieg", password: "password123")
      expect(User.authenticate(email: 'wrong@gmail.com', password: 'password123')).to be_nil
    end
  end
end
