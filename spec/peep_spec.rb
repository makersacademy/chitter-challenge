require 'peep'
require 'pg'
require 'database_helpers'

describe 'Peep' do

  it 'allows user to create a peep' do
    peep = Peep.create(peep: "test for creating peep", time: Time.new(2000))
    persisted_data =persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data.first['id']
    expect(peep.peep).to eq "test for creating peep"

  end

  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    peep = Peep.create(peep: "test peep for all method", time: Time.new(2000))
    Peep.create(peep: "second test peep for all method", time: Time.new(2003))

    peeps = Peep.all

    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.peep).to eq "test peep for all method"

    end

    it 'deletes the created peep' do
      peep = Peep.create(peep: 'test for deleting the created peep', time: Time.new(2000))

      Peep.delete(id: peep.id)

      expect(Peep.all.length).to eq 0

    end

    it 'updates a peep with the given peep' do
      peep = Peep.create(peep: 'test peep for updating peep', time: Time.new(2000))
      updated_peep = Peep.update(id: peep.id, peep: 'edit test peep for updating peep', time: Time.now)

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq peep.id
      expect(updated_peep.peep).to eq 'edit test peep for updating peep'
    end

    it 'returns the requested peep object' do
      peep = Peep.create(peep: 'test peep for updating peep', time: Time.new(2000))

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq peep.id
      expect(result.peep).to eq 'test peep for updating peep' 
    end

end
