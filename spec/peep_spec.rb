require 'peep'
require 'database_helpers'

describe Peep do

  describe ".create" do

    it "creates a new peep" do
      peep = Peep.create(text: 'My first peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'My first peep'

    end
  end

  describe ".all" do

    it "displays all peeps" do

      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(text: 'My first peep')
      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'My first peep'

    end

  end

  describe "timestamp" do

    it "peep has a timestamp" do

      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(text: 'My first peep')
      peeps = Peep.all

      expect(peeps.first.created_at).to eq peep.created_at

    end

  end

end
