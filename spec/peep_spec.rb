require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    peep = Peep.add(name: "Clare", peep: "This is a peep")
    Peep.add(name: "Bex", peep: "How you doin?")
    Peep.add(name: "Janet", peep: "Hey there guys")

    peeps = Peep.all

    expect(peeps.length).to eq 3
  end

  describe '.add' do
    it 'should create a new peep' do
      connection = PG.connect(dbname: 'chitter_manager_test')
  
      peep = Peep.add(name: "Clare", peep: "This is a peep")
      persisted_data = persisted_data(id: peep.id)
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.name).to eq 'Clare'
      expect(peep.peep).to eq 'This is a peep'
    end
  end
end