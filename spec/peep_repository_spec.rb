require 'peep_repository'

RSpec.describe PeepRepository do
  def reset_chitter_tables
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_chitter_tables
  end
end