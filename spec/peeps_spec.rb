require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: 'Test')

      expect(peep.message).to eq 'Test'
    end
  end
end
