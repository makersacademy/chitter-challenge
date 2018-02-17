# require 'database_connection'
#
# describe DatabaseConnection do
#
#   describe '::setup' do
#     it "receives a message to connect to the database through PG" do
#       expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
#       DatabaseConnection.setup('bookmark_manager_test')
#     end
#
#     it 'sets up connection to targeted database' do
#       expect(described_class.setup("bookmark_manager_test")).to be_an_instance_of(PG::Connection)
#     end
#   end
#
#   describe '::connection' do
#     it "creates persistent connection" do
#       connection = DatabaseConnection.setup('bookmark_manager_test')
#       expect(DatabaseConnection.connection).to eq connection
#     end
#   end
#
#   describe '::query' do
#     it 'outputs the expected result' do
#       described_class.setup('bookmark_manager_test')
#       query_string = "SELECT url FROM links LIMIT 1"
#       expect(described_class.query(query_string)).to eq([['http://www.makersacademy.com']])
#     end
#   end
#
#
# end
