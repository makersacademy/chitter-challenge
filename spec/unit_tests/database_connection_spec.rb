require 'database_connection'

describe DatabaseConnection do
	 describe '.setup' do
 	 	it 'setup the database connection' do
  		 	connection = DatabaseConnection.setup('shouter_database_test')
  		 	expect(connection.db).to eq('shouter_database_test')
  		end
 	end

	 describe '.query' do
 	 	it 'sends a query or instruction to the database' do
  		 	expect(DatabaseConnection).to respond_to(:query).with(1).argument
  		 	connection = DatabaseConnection.setup('shouter_database_test')
  		 	sql = "INSERT INTO shouts (user_id, time_shouted, shout_content) VALUES('1', '27 March 2021 | 22:20','this is my first shout') RETURNING shout_content;"
  		 	expect(connection.query(sql)[0]['shout_content']).to eq 'this is my first shout'
  		end
 	end
end
