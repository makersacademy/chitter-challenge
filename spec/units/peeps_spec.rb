require_relative '../../lib/peeps'
require_relative "../helper_methods"
require 'pg'

describe Peeps do
  describe '#post_peep' do
    before do
      clear_table
      add_peeps
    end
    it 'adds a peep to the peeps database' do
      Peeps.post_peep('A peep')
      expect(Peeps.all[0].text).to eq 'A peep'
    end
    xit 'sorts peeps by date' do
      expect(Peeps.all[0].date.to_i).to be < Peeps.all[1].date.to_i
    end
  end
end
