require 'user_repository'
require 'peep_repository'

RSpec.describe 'user_integration' do
  def reset_chitter_tables
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_chitter_tables
  end

  context 'The Find By ID method' do
    it 'should return the username associated with the peep' do
      peep_repo = PeepRepository.new  
      peep = Peep.new
      peep.content = 'Jack here with a third peep!'
      peep.time = '2023-05-10 14:56:09'
      peep.user_id = '1'
      
      peep_repo.create(peep)
      user_repo = UserRepository.new
      user = user_repo.find_by_id(peep.user_id)
      expect(user).to eq 'skates'
    end
  end
end