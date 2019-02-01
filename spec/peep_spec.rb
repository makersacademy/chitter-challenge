require 'peep'
require_relative './features/web_helpers'

describe Peep do
  describe '#all' do
    it 'should return a list of all the peeps' do
      populate_test_data
      peeps = Peep.all
      expect(peeps[0]).to be_a Peep
      expect(peeps[-1].body).to include "Test peep"
    end

    it 'should return in reverse chronological order' do
      populate_test_data
      Peep.add("Added peep")
      peeps = Peep.all
      expect(peeps[0].body).to eq "Added peep"
      # expect("Peeping about snow").to appear_before('Test peep')
    end
  end

  describe '#add' do
    it 'should add a given peep to the database with date' do
      time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
      Peep.add("Added peep")
      expect(Peep.all.last.body).to eq "Added peep"
      expect(Peep.all.last.time).to eq time
    end
  end
end
