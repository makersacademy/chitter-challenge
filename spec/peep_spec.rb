describe 'Peep' do
    describe '#create' do
        it 'allows the user to create a new peep' do
            peep = Peep.create(peep: "Hello, my name is Ziad", time_posted: DateTime.now)
            expect(peep).to be_a Peep
            expect(peep.peep).to eq "Hello, my name is Ziad"
        end
    end
    describe '#all' do
        it 'shows all of the peeps' do
            Peep.create(peep: "Hi, my name is Ziad", time_posted: DateTime.now)
            Peep.create(peep: "Hi, my name is Dave", time_posted: DateTime.now)

            peeps = Peep.all
            expect(peeps.first).to be_a Peep
            expect(peeps.first.peep).to eq "Hi, my name is Ziad"
        end
    end


end