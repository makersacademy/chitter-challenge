require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all bookmarks' do
      Chitter.add('My first peep')
      Chitter.add('My second peep')
      Chitter.add('My third peep')

      expected_peeps = [
        'My first peep',
        'My second peep',
        'My third peep'
      ]

      expect(Chitter.all).to eq expected_peeps
    end
  end
end
