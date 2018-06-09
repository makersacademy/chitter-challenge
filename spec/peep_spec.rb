require 'peep'

describe Peep do 
    describe '.all' do
        it 'returns all peeps' do
            
            Peep.create(content: "Great content")
            Peep.create(content: "140 characters are no longer a rule")
            Peep.create(content: "This website won''t ever become toxic!")

            peeps = Peep.all
            
            expect(peeps).to include("Great content")
            expect(peeps).to include("140 characters are no longer a rule")
            expect(peeps).to include("This website won't ever become toxic!")
        end
    end
end 
