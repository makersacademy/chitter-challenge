require 'database_connection'

describe DatabaseConnection do
	describe '.setup' do
		it 'sets up a connection to a database through PG' do
			expect(PG).to receive(:connect).with(dbname: 'chitter_test')

			DatabaseConnection.setup('chitter_test')
		end

		it 'This connection is persistent' do
			connection = DatabaseConnection.setup('chitter_test')
			expect(DatabaseConnection.connection).to eq connection
		end
	end

	describe '.query' do
		it 'execute via pg' do
			connection = DatabaseConnection.setup('chitter_test')
			expect(connection).to receive(:exec).with("SELECT * FROM messages;")
			DatabaseConnection.query("SELECT * FROM messages;")
		end
	end
end