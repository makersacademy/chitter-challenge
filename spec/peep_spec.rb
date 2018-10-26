require 'peep'
require_relative '../lib/database_connection'

describe Peep do
  describe '#create' do
    it 'posts a peep' do
      Peep.create("adding a peep")
      expect(Peep.all[0][:peep]).to eq "adding a peep"
    end
  end

  describe '#all' do
    it 'returns peeps' do
      Peep.create('peep a')
      Peep.create('peep b')
      expect(Peep.all).to be_a(Array)
    end

    it 'returns peeps sorted' do
      Peep.create('peep a new')
      Peep.create('peep b new')
      # p Peep.all
      expect(Peep.all[0][:peep]).to eq "peep b new"
    end
  end

  describe '#date_only' do
    it 'formats a date' do

      expect(Peep.date_only("2018-10-26 11:26:57.230095")).to eq "26/10/2018 11:26:57"
    end
  end
end
