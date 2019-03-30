require 'peep'

describe Peep do

    describe 'create a Peep instance' do
      it 'when sending the create message to Peep class' do
        peep = Peep.create(name: 'Cosmin', handle: '@micosmin', peep:'Hello world', timestamp:'10m')
        expect(peep.name).to eq 'Cosmin'
        expect(peep.handle).to eq '@micosmin'
        expect(peep.peep).to eq 'Hello world'
        expect(peep.timestamp).to eq '10m'

      end
    end

end