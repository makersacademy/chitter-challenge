require 'peep'

describe Peep do

  describe '.all' do
    it 'displays all peeps from a database' do
      expect(Peep.all).to eq []
    end
  end
end
