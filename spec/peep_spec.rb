require_relative '../lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns an array of peeps' do
      array = Peep.all
      expect(array).to be_an_instance_of(Array)
      expect(array[0]).to be_an_instance_of(Peep)
    end
  end
end
