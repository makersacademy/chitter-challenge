require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds_chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

  context '#all_with_user' do
    it 'finds all peeps that are not replies and their author' do
      repo = PeepRepository.new

      peeps = repo.all_with_user
      expect(peeps.length).to eq 3
      expect(peeps.first.id).to eq 1
      expect(peeps.first.message).to eq 'Hello world'
      expect(peeps.first.timestamp).to eq '2023-04-28 12:45:05'
      expect(peeps.first.user.name).to eq 'Bob'
      expect(peeps.first.user.username).to eq 'bob678'
    end

    it 'orders the result set by timestamp' do
      repo = PeepRepository.new

      peeps = repo.all_with_user
      expect(peeps.last.id).to eq 2
      expect(peeps.last.message).to eq 'This is a great peep'
      expect(peeps.last.timestamp).to eq '2023-05-03 16:23:34'
    end
  end

  context '#create' do
    it 'creates a new peep' do
      repo = PeepRepository.new
      peep = Peep.new
      peep.message = 'This is a new peep'
      peep.timestamp = '2023-05-07 12:23:34'
      peep.user_id = 1
      # peep.parent_id = NULL

      repo.create(peep)

      expect(repo.all_with_user.length).to eq 4
      expect(repo.all_with_user.last.message).to eq 'This is a new peep'
      expect(repo.all_with_user.last.user.name).to eq 'Bob'
    end
  end
  
end
