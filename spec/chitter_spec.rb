require './lib/chitter'

describe Chitter do 

    describe '.post_peep' do     
         it 'should create ' do 
            Chitter.post_peep(peep: 'This is my first peep')

            expect(Chitter.timeline.first).to include 'This is my first peep'
        end
    end 

    describe '.timeline' do 
        it 'should show all peeps' do 
            Chitter.post_peep(peep: 'This is my first peep')
            Chitter.post_peep(peep: 'This is my second peep')

            chitters = Chitter.timeline 

            expect(chitters.first).to include('This is my first peep')
            expect(chitters.last).to include('This is my second peep')
        end
    end

end