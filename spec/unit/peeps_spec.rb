require "date"

describe Peep do

  let(:id) { 1 }
  let(:message_1) { "Strawberries" }
  let(:peep) { Peep.new(id: id, message: message_1, time: DateTime.now()) }

  describe "#new" do
    it "makes a new instance of a peep" do
      expect(peep).to be_instance_of Peep
      expect(peep.message).to eq message_1
      expect(peep.id).to eq id
      expect(peep.time).to be_instance_of DateTime
    end
  end
  
  describe ".all" do
    it "returns an array of instances of peeps" do
      Peep.create(message: message_1)
      Peep.create(message: "Blueberries")
      Peep.create(message: "Blackberries")
      expect(Peep.all.length).to eq 3
      expect(Peep.all.first.message).to eq("Blackberries")
    end
  end
  
  describe ".create" do
    it "inserts an entry and returns an instance of peep" do
      created_peep = Peep.create(message: message_1)
      expect(created_peep).to be_a Peep
      expect(created_peep.message).to eq("Strawberries")
    end
  end

  describe ".connect_to_db" do
    it "connects to an appropriate database depending on the environment" do
      db_connection = Peep.connect_to_db
      expect(db_connection).to be_a PG::Connection
    end
  end

end