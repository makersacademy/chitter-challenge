require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(text: "Peep1")
      Peep.create(text: "Peep2")
  
      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq "Peep1"
    end
  end

  describe '#.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'Peep3')
      expect(peep.text).to eq 'Peep3'
    end
  end

  describe '#.reverse' do
    it 'returns the peeps in reverse chronological order' do
      allow(Time).to receive(:now).and_return(Time.parse("2019-04-27 14:41:22 +0100"))
      Peep.create(text: 'First peep')
      allow(Time).to receive(:now).and_return(Time.parse("2019-04-27 14:45:22 +0100"))
      Peep.create(text: 'Second peep')

      peeps = Peep.reverse
      expect(peeps.first.text).to eq 'Second peep'

    end
  end
end
