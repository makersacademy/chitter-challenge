require 'peep'

describe Peep do
  describe '.all' do
    it 'displays list of peeps' do
      peeps = Peep.all
      texts = peeps.map(&:text)
      expect(texts).to include('how are you people?')
      expect(texts).to include('bored at home')
    end
  end

  describe '.post_peep' do
    it 'allows user to post a new peep' do
      Peep.post_peep('test_peep')
      peeps = Peep.all
      texts = peeps.map(&:text)
      expect(texts).to include('test_peep')
    end
  end
end
