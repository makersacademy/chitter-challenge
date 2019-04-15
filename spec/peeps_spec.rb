require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: 'Test', user_id: 1)

      expect(peep.message).to eq 'Test'
    end
  end

  describe '.all' do
    it 'gets all peeps' do
      peep = Peeps.create(message: 'Test', user_id: 1)
      peeps = Peeps.all

      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq peep.message
    end
  end
end
