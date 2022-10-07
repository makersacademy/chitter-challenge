require "spec_helper"
require "rack/test"
require_relative '../../app'
require_relative '../../lib/maker_handler'
require_relative '../../lib/maker_repository'
require_relative '../../lib/peep_repository'

def reset_tables
  peeps_seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  makers_seed_sql = File.read('spec/seeds/makers_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(peeps_seed_sql)
  connection.exec(makers_seed_sql)
end

describe MakerHandler do
  before(:each) do 
    reset_tables
    reset_tables
  end
    
  include Rack::Test::Methods
  let(:app) { MakerHandler.new }


end