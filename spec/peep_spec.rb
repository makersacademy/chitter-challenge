require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Going to the beach today')
      expect.(peep.first.message).to eq('Going to the beach today')
    end
  end
end