require "peep"

describe Peep do
  describe ".all" do
    connection = PG.connect(dbname: 'peeps_manager_test')

    peep = Peep.create(message: "Howdy!")
    Peep.create(message: "Anyone there?")
    Peep.create(message: "Party time!")

    peeps = Peep.all
    p peeps

    it "returns a list of peeps" do
      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq "Howdy!"
    end
  end

  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create(message: "Hello everyone!")
      persisted_data = PG.connect(dbname: 'peeps_manager_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")
      
      p peep
      p persisted_data.first

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq "Hello everyone!"
    end
  end


end