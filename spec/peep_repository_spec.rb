require 'peep_repository'
require 'peep'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  context '#all' do
    it 'returns correct amount of peeps' do
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps.length).to eq(9)
    end

    it 'returns correct peep data' do
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps[0].id).to eq(1)
      expect(peeps[0].content).to eq('First peep')
      expect(peeps[0].peep_time).to eq('2022-03-01 09:02:39')
      expect(peeps[0].likes).to eq(4)
      expect(peeps[0].user_id).to eq(1)
    end

    it 'returns correct peep data' do
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps[7].id).to eq(8)
      expect(peeps[7].content).to eq('Second peep')
      expect(peeps[7].peep_time).to eq('2023-02-12 07:02:12')
      expect(peeps[7].likes).to eq(7)
      expect(peeps[7].user_id).to eq(4)
    end
  end

  context '#create' do
    it 'it creates a new peep' do
      repo = PeepRepository.new
      new_peep = Peep.new

      new_peep.content = 'Another peep'
      new_peep.peep_time = '2023-03-06 10:52:12'
      new_peep.likes = '0'
      new_peep.user_id = '3'

      repo.create(new_peep)

      peeps = repo.all

      expect(peeps.length).to eq(10)
      expect(peeps.last.id).to eq(10)
      expect(peeps.last.content).to eq('Another peep')
      expect(peeps.last.peep_time).to eq('2023-03-06 10:52:12')
      expect(peeps.last.likes).to eq(0)
      expect(peeps.last.user_id).to eq(3)
    end
  end
end