require 'peep'

describe Peep do
    it 'will return a list of peeps' do
        peep = Peep.add(body: "This is a test peep")
        expect(peep.body).to eq 'This is a test peep'
    end
end