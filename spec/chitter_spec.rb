require 'chits'

describe Chits do
    describe '.all' do
      it 'returns all chitters' do
       chitter = Chits.all
  
        expect(chitter).to include("Hey you! this is Chitter")
        expect(chitter).to include("Have something to Chit?")
        expect(chitter).to include("Chit it now!")
      end
    end
  end
  