require 'peeps'
require 'persisted_data'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(peep: "First peep")
      id = peep.id
      persisted_data = persisted_data(table: 'peeps', id: id)

      expect(peep).to be_a Peeps
      expect(peep.peep).to eq 'First peep'
      expect(peep.id).to eq persisted_data['id']
    end
  end

  # describe '.find' do
  #   it 'finds a peep by its id' do
  #     peep = Peeps.create(peep: "First peep")
  #     id = peep.id
  #
  #     returned_peep = Peeps.find(id: id)
  #
  #     expect(returned_peep).to be_a Peeps
  #     expect(returned_peep.id).to eq id
  #     expect(returned_peep.peep).to eq 'First peep'
  #   end
  # end

  describe '.all' do
    it 'returns all the peeps from the database' do
      Peeps.create(peep: "First peep")
      Peeps.create(peep: "Second peep")
      peep = Peeps.create(peep: "Third peep")

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq peep.peep
    end
  end
end
