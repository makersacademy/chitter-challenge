require 'peep'

describe Peep do
  context '.all' do
    it 'returns all peeps' do

      peep = Peep.save(message: 'blah blah blah')
      Peep.save(message: 'chitter chatter')
      Peep.save(message: 'pitter patter')

      peeps = Peep.all
      expect(peeps.length).to eq(3)
      expect(peeps.first.message).to eq('blah blah blah')
      expect(peeps.first).to be_a(Peep)
    end
  end

  context '.save' do
    it 'peep will be saved in the database' do
      peep = Peep.save(message: 'blah blah blah')
      expect(peep.message).to eq('blah blah blah')
    end
  end

end
