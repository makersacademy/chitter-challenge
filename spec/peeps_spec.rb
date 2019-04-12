require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: 'Test')

      expect(peep.message).to eq 'Test'
    end
  end

  describe '.all' do
    it 'gets all peeps' do
      peep = Peeps.create(message: 'Test')
      peeps = Peeps.all

      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq peep.message
    end
  end
end
