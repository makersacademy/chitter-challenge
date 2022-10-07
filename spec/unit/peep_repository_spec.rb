require 'peep_repository'
require 'database_connection'

def reset_peeps_table
  seed_sql = File.read('spec/peep_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  context 'chitter database contains populated peeps table' do
    it 'gets all peeps' do
      repo = PeepRepository.new
      peeps = repo.all
      expect(peeps.length).to eq 2
      expect(peeps[0].message).to eq 'Nice weather this morning!'
      expect(peeps[0].tag).to eq 'Miles'
      expect(peeps[0].time).to eq '2004-10-19 10:30'
      expect(peeps[0].user_id).to eq'1'
    end
  end
end

# # 2
# # finds a peep

# repo = PeepRepository.new

# peep = repo.find(2)
# peep.message # => 'Love this song!'
# peep.tag # => 'Miles'
# peep.time # => '2001-01-14 08:45'
# peep.user_id # => '1'

# # 3
# # Create a new peep

# repo = PeepRepository.new
# new_peep = Peep.new
# new_peep.message = 'Hello, world!'
# new_peep.tag = ''
# new_peep.time = '2022-01-01 12:00'
# new_peep.user_id = '1'
    
# repo.create(new_peep) # => nil

# peeps = repo.all
# last_peep = peeps.last
# last_peep.message # => 'Hello, world!'
# last_peep.tag # => ''
# last_peep.time # => '2022-01-01 12:00'
# last_peep.user_id # => '1'
# end