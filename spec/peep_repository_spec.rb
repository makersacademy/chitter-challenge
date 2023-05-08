require 'peep_repository'

describe PeepRepository do
  
  def reset_peeps_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_base_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_peeps_table
  end

  # it 'Should ' do

  # end
end
