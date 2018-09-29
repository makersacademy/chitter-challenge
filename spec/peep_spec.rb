require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.create(message: 'test peep 1')
      Peep.create(message: 'test peep 2')
      Peep.create(message: 'test peep 3')
      peeps = Peep.all
      peep = Peep.all.first
      expect(peeps.length).to eql(3)
      expect(peep).to be_a(Peep)
      expect(peep).to respond_to(:id)
      expect(peep).to respond_to(:time)
      expect(peep.message).to eq('test peep 1')
    end
  end

  describe '.create' do
    it 'adds a new peep' do
      peep = Peep.create(message: 'test peep 4')
      expect(peep).to be_a(Peep)
      expect(peep).to respond_to(:id)
      expect(peep.message).to eq('test peep 4')
    end
    it 'automatically adds a time stamp' do
      peep = Peep.create(message: 'test peep')
      expect(peep).to respond_to(:time)
      expect(peep.time).not_to be_empty
    end
  end
end
