require 'peep'

describe Peep do
  subject(:peep) { Peep.new }

  describe '.post_peep' do
    it 'allows user to post a peep' do
      peep.post_peep('This is my peep', 'leon_linton')
      peeps = peep.post_peep
      expect(peeps).to include 'This is my peep'
    end
  end

  describe '.all' do
    it 'allows user to see all peeps' do
      expect(peep.all).to be_an Array
    end
  end
end
