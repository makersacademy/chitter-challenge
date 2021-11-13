require 'peep'

describe Chitter do 
    describe '.all' do
        it 'returns all peeps' do
            peeps = Peep.all

            expect(peeps).to  include("I ate a sandwich today")
            expect(peeps).to  include("I love sandwiches")
        end 
    end 
end 