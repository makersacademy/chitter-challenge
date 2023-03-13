require 'user_repository'
require 'peep_repository'
require 'peep_model'
require 'user_model'

def reset_peeps_table
    seed_sql = File.read('spec/seeds_peeps_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitterdb_test' })
    connection.exec(seed_sql)
end

RSpec.describe "integration" do
  before(:each) do 
    reset_peeps_table
  end

  xit 'Creates a user and two peeps.' do
  end
end
