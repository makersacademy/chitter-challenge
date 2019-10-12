# require 'database_connection'
#
# describe DatabaseConnection do
#   describe '#setup' do
#     it 'sets up a connection to the database' do
#       expect(PG).to receive(:connect).with(dbname: 'chitter_test')
#       DatabaseConnection.setup('chitter_test')
#     end
#   end
#
#   describe '.query' do
#     it 'executes the SQL query string on the database' do
#       connection = DatabaseConnection.setup('chitter_test')
#       expect(connection).to receive(:exec).with("SELECT * FROM messages;")
#       DatabaseConnection.query("SELECT * FROM messages;")
#     end
#   end
# end
