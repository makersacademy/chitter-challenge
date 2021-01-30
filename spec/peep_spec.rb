require 'peeps'
describe Peep do 
    describe '.all' do 
        it 'should show the users peep' do 
        peeps = Peep.all 

        expect(peeps).to include('1 peep')
        expect(peeps).to include('2 peep')
        expect(peeps).to include('3 peep')
    end 
end 
end 