require 'peep'

describe Peep do
  before do
    conn = PG.connect(dbname: 'chitter_test')
    conn.exec("TRUNCATE peeps;")
  end
  
  context '.add'
    it 'adds a peep to the database' do
      peep = Peep.create('Hello')

      expect(peep).to be_a Peep
      expect(peep.message).to eq 'Hello'
    end

  context '.all'
    it 'returns an array of peeps' do
      peep = Peep.create('Hello')
      Peep.create('Bye')
      Peep.create('Ciao')
      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peeps[0].message).to eq 'Hello'
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].id).to eq peep.id

      expect(peeps[1].message).to eq 'Bye'
      expect(peeps[2].message).to eq 'Ciao'
    end


end
