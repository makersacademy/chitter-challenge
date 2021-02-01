require "peep"

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("TRUNCATE peeps;")

      peep = Peep.create(message: "Is it time for my food yet?", sender: "claude")
      Peep.create(message: "Do cats do anything else other than sleep or eat?", sender: "pete")
      Peep.create(message: "I am hungry and tired", sender: "claude")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq "Is it time for my food yet?"
      expect(peeps.first.sender).to eq "claude"
    end
  end

  describe ".create" do
    it "stores new peeps in the database" do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(message: "Where is my food?", sender: "claude")

      # expect(peep).to be_a Peep
      # expect(peep.time).to eq('12.09')
      # expect(peep.date).to eq('2021-01-30')
      expect(peep.message).to eq("Where is my food?")
      expect(peep.sender).to eq("claude")
    end

  end

end
