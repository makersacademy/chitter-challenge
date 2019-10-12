require 'peep'

describe Peep do

    describe '.create' do
        it 'creates a peep and saves to the database' do
            peep = Peep.create(message: 'Test Peep')
            expect(peep.message).to eq 'Test Peep'
        end
    end

    describe '.all_in_order' do
        it 'returns all peeps to the feed, newest first' do
            DatabaseConnection.query("INSERT INTO peeps (message, tdz) VALUES ('1st Test Peep', '#{Time.now - 30*60}') RETURNING *;").first
            peep = DatabaseConnection.query("INSERT INTO peeps (message, tdz) VALUES ('2nd Test Peep', '#{Time.now}') RETURNING *;").first
            peeps = Peep.all_in_order
            expect(peeps.first.message).to eq peep['message']
        end
    end

end