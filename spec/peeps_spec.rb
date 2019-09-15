require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      timeline = Peeps.all

      expect(timeline).to include "its not the best"
    end
  end
end
