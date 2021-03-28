require_relative '../../lib/peeps'
require_relative "../helper_methods"
require 'Time'
require 'pg'

describe Peeps do
  describe '#post_peep' do
    before do
      clear_table
      add_peeps
    end
    it 'adds a peep to the peeps database' do
      Peeps.post_peep('A peep','1')
      expect(Peeps.all[0].text).to eq 'A peep'
    end
    it 'sorts peeps by date' do
      expect(Date.parse(Peeps.all[0].date)).to be > Date.parse(Peeps.all[1].date)
    end
  end
end
