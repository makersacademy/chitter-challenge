def create_test_tables
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('Chitter_Test')
  end
    DatabaseConnection.query("CREATE TABLE IF NOT EXISTS peep(id SERIAL PRIMARY KEY, peep VARCHAR(500), timestamp TIMESTAMPTZ DEFAULT NOW());")
    DatabaseConnection.query("CREATE TABLE IF NOT EXISTS members(id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(30), email VARCHAR(100), password VARCHAR(150));")
end
