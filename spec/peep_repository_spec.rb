require 'peep_repository'
require 'peep'

def reset_peeps_table
    seed_sql = File.read('spec/test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
    connection.exec(seed_sql)
  end
  
  describe PeepRepository do
    before(:each) do 
      reset_peeps_table
    end
  end