require 'db_connection'

# describe '.setup' do
#   it 'sets a connection with a specified database' do
#     connection = DatabaseConnection.setup('chitter_test')
#     expect(connection.db).to eq 'chitter_test'
#   end
# end

# describe '.query' do
#   it 'executes a query string on the connected database' do
#     PG.connect(dbname:'chitter_test').exec("INSERT INTO chitter (peep, time) VALUES ('This is my first peep ever.', Time.now.strftime)")
#     DatabaseConnection.setup('chitter_test')

#     response = DatabaseConnection.query('SELECT * from chitter')
#     expect(response[0]['title']).to eq 'Google'
#     expect(response[0]['url']).to eq 'http://www.google.com'
#   end
# end
