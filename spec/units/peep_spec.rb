describe Peep do
  let(:table) { "peeps" }

  describe ".create" do
    it "should insert into peeps table and return an instance of a Peep" do
      user = User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")
      result = Peep.create(message: "Test message 1", user_id: user.id)
      persisted_data = persisted_data_retrieve(table: "peeps", id: result["id"])

      # expect(result).to be_a Peep
      expect(result["id"]).to eq persisted_data["id"]
      expect(result["message"]).to eq "Test message 1"
      expect(result["user_id"]).to eq user.id
    end
  end

  describe ".all" do
    it "should return all peeps in the peeps table" do
      user = User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")
      persisted_data_insert(table: "peeps", message: "Test message 1", user_id: user.id)
      persisted_data_insert(table: "peeps", message: "Test message 2", user_id: user.id)
      persisted_data_3 = persisted_data_insert(table: "peeps", message: "Test message 3", user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq persisted_data_3["id"]
      expect(peeps.first.message).to eq "Test message 3"
      expect(peeps.first.name).to eq "User 1"
      expect(peeps.first.user_name).to eq "Usr1"
    end
  end
end
