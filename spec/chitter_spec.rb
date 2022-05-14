require './lib/chitter.rb'

describe Chitter do
  describe '.all' do
    it 'returns all chits' do
      chits = Chitter.all
      expect(chits).to include("Help I'm tired yo")
      expect(chits).to include("Can I just shock you? I like wine")
      expect(chits).to include("My cat was right about you")
    end
  end
end
