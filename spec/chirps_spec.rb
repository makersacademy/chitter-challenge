require 'chirps'

describe Chirps do
  
    describe '.all' do
        it 'returns all chirps' do
            connection = PG.connect(dbname: 'chitter_test')

            connection.exec("INSERT INTO chirps (chirp) VALUES ('This is one chirp');")
            connection.exec("INSERT INTO chirps (chirp) VALUES('This is another chirp');")
            connection.exec("INSERT INTO chirps (chirp) VALUES('This is a totally different chirp');")

            chirps = Chirps.all

            expect(chirps).to include("This is one chirp")
            expect(chirps).to include("This is another chirp")
            expect(chirps).to include("This is a totally different chirp")
        end
    end

    describe '.create' do
        it 'creates a new chirp' do
            Chirps.create(chirp: 'First created chirp')
        
            expect(Chirps.all).to include('First created chirp')
        end
    end
end