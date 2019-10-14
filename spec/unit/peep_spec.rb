require 'peep'

describe Peep do

    describe '.create' do
        it 'creates a peep and saves to the database' do
            id = DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test') RETURNING id;").first['id']
            Peep.create(message: 'Test Peep', user_id: id)
            peep = DatabaseConnection.query('SELECT * FROM peeps;').first
            expect(peep['message']).to eq 'Test Peep'
        end
    end

    describe '.all_in_order' do
        it 'returns all peeps to the feed, newest first' do
            id = DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('test', 'test@test.com', 'test') RETURNING id;").first['id']
            DatabaseConnection.query("INSERT INTO peeps (message, tdz, user_id) VALUES ('1st Test Peep', '#{Time.now - 30*60}', #{id}) RETURNING *;").first
            peep = DatabaseConnection.query("INSERT INTO peeps (message, tdz, user_id) VALUES ('2nd Test Peep', '#{Time.now}', #{id}) RETURNING *;").first
            peeps = Peep.all_in_order
            expect(peeps.first.message).to eq peep['message']
        end
    end

end