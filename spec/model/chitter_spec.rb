require './lib/chitter'
require 'database_helpers'

describe Chitter do 

    describe '.post_peep' do     
         it 'should create' do 
            peep = Chitter.post_peep(peep: 'This is my first peep', userid: 1)
            persisted_data = persisted_data(peep.id)
            expect(peep).to be_a Chitter
            expect(peep.id).to eq persisted_data['id']
            expect(peep.peep).to eq 'This is my first peep'
        end
    end 

    describe '.timeline' do 
        it 'should show all peeps' do 
            Chitter.post_peep(peep: 'This is my first peep', userid: 1)
            Chitter.post_peep(peep: 'This is my second peep', userid: 2)

            chitters = Chitter.timeline 

            expect(chitters.first.peep).to include('This is my first peep')
            expect(chitters.last.peep).to include('This is my second peep')
        end
    end

end