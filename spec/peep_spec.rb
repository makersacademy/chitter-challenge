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

end


