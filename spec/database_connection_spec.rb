require 'database_connection'

describe DatabaseConnection do
    describe '#setup' do
        it 'Take the database name, connect to it and expect it be a PG connection class' do
        expect(DatabaseConnection.setup('chitter_test')).to be_kind_of(PG::Connection)
        end
    end

    describe '#query' do
        it 'Take a query string and execute it' do
        DatabaseConnection.setup('chitter_test')
        expect(DatabaseConnection.query('SELECT * FROM peep;')).to be_kind_of(PG::Result)
        end
    end
end