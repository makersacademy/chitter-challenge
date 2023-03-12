require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_db_test' })
  connection.exec(seed_sql)
end

def reset_makers_table
  seed_sql = File.read('spec/seeds/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_db_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
  
  before(:each) do 
    reset_makers_table
    reset_peeps_table
  end
  let(:app) { Application.new }

end
