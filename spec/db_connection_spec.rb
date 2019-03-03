describe Db_connection do
  it 'returns results from database' do
    clean_test_database
    create_dummy_user
    result = Db_connection.query("select * from users")
    expect(result).to contain('tester')
  end
end
