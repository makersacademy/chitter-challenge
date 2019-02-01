require 'peep'
require_relative './features/web_helpers'

describe Peep do
  describe '#all' do
    it 'should return a list of all the peeps' do
      populate_test_data
      peeps = Peep.all
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].body).to include "Test peep"
    end
  end

  describe '#add' do
    it 'should add a given peep to the database' do
      Peep.add("Added peep")
      expect(Peep.all.last.body).to eq "Added peep"
    end
  end
end
