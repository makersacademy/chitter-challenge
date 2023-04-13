require 'user_repository'

# Need to user PG connect and then exec here as connection specified in database_connection will not be able send multiple sql lines

def reset_user_table
  seed_sql = File.read('spec/seeds_users')
  connection = PG.connect({ host: 127.0.0.1, dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_user_table
  end

  context "Test all method" do
    it "returns all the records" do
      repo = UserRepository.new
      all


end