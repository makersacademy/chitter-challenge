require 'pg'

describe User do
  describe ".all" do
    it "displays all users of Chitter" do
      sophie = User.create(firstname: "Sophie", lastname: "Gilder", email: "sophie.macramazing@gmail.com", handle: "sophieg", password: "password123")
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE id = #{sophie.id};")
      User.create(firstname: "Joe", lastname: "Gilder", email: "joe@gmail.com", handle: "joeg", password: "999woopyeah")

      expect(User.all.size).to eq 2
      expect(User.all.first.firstname).to eq "Sophie"
      expect(User.all.first.id).to eq persisted_data.first['id']
    end
  end

  describe ".create" do
    it "adds a new user to the database" do
      sophie = User.create(firstname: "Sophie", lastname: "Gilder", email: "sophie.macramazing@gmail.com", handle: "sophieg", password: "password123")
      expect(User.all.first.firstname).to eq "Sophie"
    end
  end

  describe ".find" do
    it "finds the user based on the id stored in the session" do
    sophie = User.create(firstname: "Sophie", lastname: "Gilder", email: "sophie.macramazing@gmail.com", handle: "sophieg", password: "password123")
    result = User.find(id: sophie.id)

    expect(result.id).to eq sophie.id
    expect(result.firstname).to eq "Sophie"
    end 

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
