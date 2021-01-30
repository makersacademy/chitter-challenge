require 'peeps'
describe Peep do 
    describe '.all' do 
        it 'should show the users peep' do 
        peeps = Peep.all 

        expect(peeps).to include('peeps')
        expect(peeps).to include('peeps')
        expect(peeps).to include('peeps')
    end 
end 
end 