require './lib/peep'

describe Peep do

  describe '.post_peep' do
    it 'allows user to post a peep' do
      Peep.post_peep('This is my peep', 'leon_linton')
      peeps = Peep.all
      expect(peeps.last.peep).to include 'This is my peep'
    end
  end

  describe '.all' do
    it 'allows user to see all peeps' do
      expect(Peep.all).to be_an Array
    end
  end
end
