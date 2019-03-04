require 'pg'
require 'peep'

describe Peep do
  describe '.all' do
    it 'list peeps in reverse chronological order' do
      peeps = Peep.all

      expect(peeps).to include('2019-03-03; 08:52; The peep at the top of the page is the most recent')
      expect(peeps).to include('2019-03-02; 10:45; Homepage shows peeps in reverse chronological order')
      expect(peeps).to include('2019-03-02; 10:34; On Chitter, we post messages called "Peeps"')
    end
  end
end