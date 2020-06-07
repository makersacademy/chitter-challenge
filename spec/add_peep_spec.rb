require 'peep'
require 'pg'

describe '.add' do
    it 'adds a peep' do
      Peep.add(peep: 'me again')
  
      expect(Peep.all).to include 'me again'
    end
  end