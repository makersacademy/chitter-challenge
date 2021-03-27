require_relative '../../lib/peeps'
require 'pg'
describe Peeps do
  describe '#post_peep' do
    it 'adds a peep to the peeps database' do
      Peeps.post_peep('A peep')
      expect(Peeps.all[1].text).to eq 'A peep'
    end
  end
end
