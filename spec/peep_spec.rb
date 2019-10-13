require 'peep'

describe Peep do
  describe '.all' do
      it 'returns a list of peeps' do
        connection = PG.connect(dbname: 'chitter_test')
     
        peep = Peep.create(text: 'Hello!', time: 'Now')
        Peep.create(text: 'Hello again!', time: 'Later than now')
     
        peeps = Peep.all
     
        expect(peeps.length).to eq 2
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.text).to eq 'Hello!'
        expect(peeps.first.time).to eq 'Now'
       end
     end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'Im a new peep!', time: 'Time.new').first
  
      expect(peep['text']).to eq 'Im a new peep!'
      expect(peep['time']).to eq 'Time.new'
    end
  end
end
