# require 'database_connection'
#
# RSpec.describe DatabaseConnection do # tests setup, a wrapper of the PG.connect method
#   describe '.setup' do
#     it 'sets up a connection to a database through PG' do
#       expect(PG).to receive(:connect).with(dbname: 'chitter_test')
#       DatabaseConnection.setup('chitter_test')
#     end
#   end
#
#
#
#   describe '.query' do
#     it 'executes an SQL query via PG' do
#       connection = DatabaseConnection.setup('chitter_test')
#       expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
#       DatabaseConnection.query("SELECT * FROM peeps;")
#     end
#   end
# end
