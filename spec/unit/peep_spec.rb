require 'peep'
require 'database_helpers'

describe Peep do

    describe '.all' do
        it 'returns a list of peeps' do
            Peep.post(message: "Test peep 1")
            Peep.post(message: "Test peep 2")
            Peep.post(message: "Test peep 3")
            peeps = Peep.all

            expect(peeps.length).to eq 3
            expect(peeps.first).to be_a Peep
        end
    end

    describe '.post' do
        it 'adds a peep to the database' do
            peep = Peep.post(message: 'Test peep - post')
            persisted_data = persisted_data(id: peep.id, table: :peeps)
            
            expect(peep).to be_a Peep
            expect(peep.id).to eq persisted_data['id']
            expect(peep.message).to eq 'Test peep - post'
            expect(peep.date).to eq Time.now.strftime("%Y-%m-%d")
        end
    end
end