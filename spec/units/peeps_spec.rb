require 'peep'

describe Peep do
  subject(:peep) { Peep.new }

  describe '.post_peep' do
    it 'allows user to post a peep' do
      expect(peep.post_peep('This is my peep')).to eq 'This is my peep'
    end
  end
end
