require './lib/chitters'
require 'time'
require 'date'
#require 'active_support/time'

describe Chitters do
    describe '#Add peep' do
      it 'Adds new peeps' do
        Chitters.addpeep('test peep')
        peeps = Chitters.view_peeps
        expect(peeps[0].peep).to include 'test peep'
        
      end
    end


    describe '#view_peeps' do
      it 'can view peeps' do
        Chitters.addpeep("test peep")
        
        peeps = Chitters.view_peeps

        expect(peeps.first.peep).to include('test peep')
      end
    end

end