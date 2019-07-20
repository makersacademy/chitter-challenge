require 'peep_manager'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it 'creates a peep and stores it in database' do
      peeps = Peep.create(peep: 'Hello Chitter')
      persisted_data = persisted_data(table: "peeps", id: peeps.id)

      expect(peeps.id).to eq persisted_data.first['id']
      expect(peeps.peep).to eq 'Hello Chitter'
    end
  end

  describe '.all' do
    it "Shows a list of all peeps in reverse chronological order" do
      Peep.create(peep: 'Hello Chitter')
      Peep.create(peep: 'Hello Chitter again')
      peep = Peep.create(peep: 'Hello Chitter again and again!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "Hello Chitter again and again!"
    end
  end
end
