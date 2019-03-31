require 'peep'

describe Peep do
  describe '.create' do
    it 'can store a new peep in the database' do
      allow(Time).to receive(:now).and_return(Time.parse("2019-03-31 11:34:39 +0100"))
      peep = Peep.create(content: 'A new peep from me!')

      expect(peep).to be_a Peep
      expect(peep.content).to eq 'A new peep from me!'
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      allow(Time).to receive(:now).and_return(Time.parse("2019-03-31 12:42:21 +0100"))
      Peep.create(content: 'A new peep from me!')
      Peep.create(content: 'Here is another!')
      Peep.create(content: 'I am chatty today')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.content).to eq 'A new peep from me!'
    end
  end

  describe '.reverse_order' do
    it 'returns all peeps in reverse chronological order' do
      allow(Time).to receive(:now).and_return(Time.parse("2019-03-31 13:27:12 +0100"))
      Peep.create(content: 'This is the first tweet')
      allow(Time).to receive(:now).and_return(Time.parse("2019-03-31 13:27:54 +0100"))
      Peep.create(content: 'This is the second tweet')

      peeps = Peep.reverse_order
      expect(peeps.first.content).to eq 'This is the second tweet'
    end
  end
end
