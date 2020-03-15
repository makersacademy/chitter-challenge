require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(text: 'I woke up!')
      Peep.create(text: 'Good morning!')
      Peep.create(text: 'Have a good day!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'I woke up!'
    end
  end

  describe '.create' do
    it 'creates a new peep and adds to collection' do
      peep = Peep.create(text: 'I woke up!')
      expect(peep).to be_a Peep
      expect(peep.text).to eq 'I woke up!'
    end
  end    
end
