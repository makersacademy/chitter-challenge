require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all bookmarks' do
      time = Time.now
      Chitter.add('My first peep', time)
      Chitter.add('My second peep', time)
      expect { Chitter.add('My third peep', time) }.to change { Chitter.all.length }.by 1
    end
  end
end
