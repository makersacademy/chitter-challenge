require 'peeps'

describe Peeps do

  describe '#self.all' do
    it 'lists all peeps' do
      peep = Peeps.all
      output = peep.map(&:tweet)
      expect(output).to include 'this is a peep'
      expect(output).to include 'this is another peep'
      expect(output).to include 'not another one'
    end
  end

  describe '#self.create' do
    it 'creates a peeps' do
      Peeps.create(tweet: 'feeling rough')
      peep = Peeps.all
      output = peep.map(&:tweet)
      expect(output).to include 'feeling rough'
    end
  end
end
