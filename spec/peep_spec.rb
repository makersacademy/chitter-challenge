require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      
    connection = PG.connect(dbname: 'chitter_test')

    peep = Peep.create(peep: "I use chitter daily")
    Peep.create(peep: "What did you say?")

    peeps = Peep.all 
    
    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.peep).to eq "I use chitter daily"
    
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'Hi there!')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'Hi there!'
    end
  end

  describe '.delete' do
  it 'deletes the given peep' do
    peep = Peep.create(peep: 'Hi again')

    Peep.delete(id: peep.id)

    expect(Peep.all.length).to eq 0
  end
end


describe '.update' do
  it 'updates the peep with the given data' do
    peep = Peep.create(peep: "Hi there again")
    updated_peep = Peep.update(id: peep.id, peep: "Why though?")

    expect(updated_peep).to be_a Peep
    expect(updated_peep.id).to eq peep.id
    expect(updated_peep.peep).to eq 'Why though?'
  end
end

describe '.find' do
    it 'returns the requested peep object' do
      peep = Peep.create(peep: 'How many times')

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq peep.id
      expect(result.peep).to eq 'How many times'
    end
  end

end


