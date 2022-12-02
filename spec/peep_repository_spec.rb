require 'peep_repository'



def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  # (tests go here).
  
end