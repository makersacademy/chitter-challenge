require './lib/db_connection.rb'

describe DatabaseConnection do
  it 'returns results from database' do
    clean_test_database
    create_dummy_user
    result = DatabaseConnection.new.run_query("select * from users")
    expect(result[0]["username"]).to eq('tester')
  end
end
