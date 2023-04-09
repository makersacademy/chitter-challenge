require 'user.rb'
require 'user_repository.rb'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'peeps_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  let(:repo) {UserRepository.new}
  # write your let(:peep_repositoty) {PeepRepository.new} here
  # as well as for user_repository 
  # see which one is needed as you write each test

  describe '#create' do
    it 'creates and stores a new peep' do

    end
  end
end