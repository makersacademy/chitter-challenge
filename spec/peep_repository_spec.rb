require 'peep'
require 'peep_repository'

describe CommentRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context 'all method' do
    it 'finds all peeps' do
      repo = PeepRepository.new
      all_peeps = repo.all
      first_peep = all_peeps.first
      last_peep = all_peeps.last
      expect(all_peeps.length).to eq 8
      expect(first_peep.id).to eq '1'
      expect(first_peep.content).to eq 'First peep ever on chitter!!!!'
      expect(first_peep.time_posted).to eq '2022-11-30 12:00:00'
      expect(first_peep.user_id).to eq '1'
      expect(last_peep.id).to eq '8'
      expect(last_peep.content).to eq 'Eleven is bigger than ten'
      expect(last_peep.time_posted).to eq '2022-11-30 12:07:00'
      expect(last_peep.user_id).to eq '4'
    end
  end

  context 'find(peep_id) method' do
    it 'finds a peep by id' do
      repo = PeepRepository.new
      peep = repo.find(1)
      expect(peep.content).to eq 'First peep ever on chitter!!!!'
      expect(peep.time_posted).to eq '2022-11-30 12:00:00'
    end

    it 'finds a different peep by id' do
      repo = PeepRepository.new
      peep = repo.find(8)
      expect(peep.content).to eq "Eleven is bigger than ten"
      expect(peep.time_posted).to eq '2022-11-30 12:07:00'
    end
  end

  context 'create method' do
    it 'creates a new peep' do
      repo = PeepRepository.new
      peep = Peep.new
      peep.content = 'I am a test peep'
      peep.time_posted = '2022-11-30 13:40:00'
      peep.user_id = '1'
      repo.create(peep)
      all_peeps = repo.all
      latest_peep = all_peeps.last
      expect(all_peeps.length).to eq 9
      expect(latest_peep.content).to eq 'I am a test peep'
      expect(latest_peep.time_posted).to eq '2022-11-30 13:40:00'
      expect(latest_peep.user_id).to eq '1'
    end
  end
end
