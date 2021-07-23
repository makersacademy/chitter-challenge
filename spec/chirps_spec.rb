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
            persisted_data = persisted_data(id: chirp.id, table: 'chirps')
        
            expect(chirp).to be_a Chirps
            expect(chirp.id).to eq persisted_data.first['id']
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

    describe '.update' do
        it 'updates the chirp with the given data' do
            chirp = Chirps.create(title: 'Editing', chirp: 'Editing this chirp now')
            updated_chirp = Chirps.update(id: chirp.id, chirp: 'Edited this chirp', title: 'Edited')
        
            expect(updated_chirp).to be_a Chirps
            expect(updated_chirp.id).to eq chirp.id
            expect(updated_chirp.title).to eq 'Edited'
            expect(updated_chirp.chirp).to eq 'Edited this chirp'
        end
    end

    describe '.find' do
        it 'returns the requested chirp object' do
            chirp = Chirps.create(title: 'Found Chirp', chirp: 'Finding this chirp')
        
            result = Chirps.find(id: chirp.id)
        
            expect(result).to be_a Chirps
            expect(result.id).to eq chirp.id
            expect(result.title).to eq 'Found Chirp'
            expect(result.chirp).to eq 'Finding this chirp'
        end
    end

    let(:comment_class) { double(:comment_class) }

    describe '#comments' do
        it 'calls .where on the Comment class' do
            chirp = Chirps.create(title: 'Commenting', chirp: 'Commenting on this chirp!!!')
            expect(comment_class).to receive(:where).with(chirp_id: chirp.id)
      
            chirp.comments(comment_class)
          end
    end
end