require './lib/peep'
require './app.rb'
require 'pg'

describe Peep do
  describe '.all' do
    it 'should display an array of peeps in reverse chronological order' do
      peep = Peep.create(message:'Hello, this is a test')
      Peep.create(message:'second test...')
      Peep.create(message:'third test...')
      peeps = Peep.all
     expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'third test...'
    end
  end
end