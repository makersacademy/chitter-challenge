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
      Peeps.post_peep('A peep', '1')
      expect(Peeps.all[0].text).to eq 'A peep'
    end
    it 'sorts peeps by date' do
      expect(Date.parse(Peeps.all[0].date)).to be > Date.parse(Peeps.all[1].date)
    end
    it 'retrieves all peeps from the database' do
      expect(Peeps.all.length).to eq 3
    end
    it 'skips a Peep if there is no text' do
      Peeps.post_peep('', '1')
      expect(Peeps.all.length).to eq 3
    end
    it 'removes apostrophes from a tweet' do
      Peeps.post_peep("It's a great day for camping!", '1')
      expect(Peeps.all[0].text).to eq 'Its a great day for camping!'
    end
  end
end
