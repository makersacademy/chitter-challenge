require 'peep'

describe Peep do 
    describe '#all' do
        it 'returns all peeps' do
            
            peep_1 = Peep.create(content: "Great content")
            peep_2 = Peep.create(content: "140 characters are no longer a rule")
            peep_3 = Peep.create(content: "This website won''t ever become toxic!")

            expected_peeps = [
                peep_1,
                peep_2,
                peep_3
            ]
            
            expect(Peep.all).to eq (expected_peeps)
        end
    end
end 
