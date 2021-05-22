require 'chirps'
require 'database_helpers'

describe Chirps do
  
    describe '.all' do
        it 'returns all chirps' do
            connection = PG.connect(dbname: 'chitter_test')

            chirp = Chirps.create(chirp: 'This is one chirp', title: 'Title one')
            Chirps.create(chirp: 'This is another chirp', title: 'Title two')
            Chirps.create(chirp: 'This is a totally different chirp', title: 'Title three')

            chirps = Chirps.all

            expect(chirps.length).to eq 3
            expect(chirps.first).to be_a Chirps
            expect(chirps.first.id).to eq chirp.id
            expect(chirps.first.title).to eq 'Title one'
            expect(chirps.first.chirp).to eq 'This is one chirp'
        end
    end

    describe '.create' do
        it 'creates a new chirp' do
            chirp = Chirps.create(chirp: 'First created chirp', title: 'First title')
            persisted_data = persisted_data(id: chirp.id)
        
            expect(chirp).to be_a Chirps
            expect(chirp.id).to eq persisted_data['id']
            expect(chirp.title).to eq 'First title'
            expect(chirp.chirp).to eq 'First created chirp'
        end
    end

    describe '.delete' do
        it 'deletes the given chirp' do
            chirp = Chirps.create(title: 'Makers Academy', chirp: 'Deleting a Marks chirp')
        
            Chirps.delete(id: chirp.id)
        
            expect(Chirps.all.length).to eq 0
        end
    end
end