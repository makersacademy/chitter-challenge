require 'peeps'
describe Peep do 
    describe '.all' do 
        it 'should show the users peep' do 
        peep = Peep.all 

        expect(peep).to include('My first peep')
    end 
end 
end 