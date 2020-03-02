describe 'Peep' do
    describe '#create' do
        it 'allows the user to create a new peep' do
            peep = Peep.create(content: "Hello, my name is Ziad")
            expect(peep).to be_a Peep
            expect(peep.content).to eq "Hello, my name is Ziad"
        end
    end
    describe '#all' do
        it 'shows all of the peeps' do
            Peep.create(content: "Hi, my name is Ziad")
            Peep.create(content: "Hi, my name is Dave")

            peeps = Peep.all
            expect(peeps.first).to be_a Peep
            expect(peeps.first.content).to eq "Hi, my name is Ziad"
        end
    end
end