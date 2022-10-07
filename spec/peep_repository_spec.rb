require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/reset_tables_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do
    reset_tables
  end

  describe '#all' do
    it 'returns all peeps' do
      peep_repository = PeepRepository.new
      expect(peep_repository.all.first.content).to eq 'Jar Jar Noises'
      expect(peep_repository.all.first.user_id).to eq '1'
      expect(peep_repository.all.first.creation_date).to eq '2022-10-07'
      expect(peep_repository.all[1].content).to eq 'Millions will be starvin and dyin without your help.'
      expect(peep_repository.all[10].content).to eq 'JESSE! HEY JESSE.. WE NEED TO COOK!'
    end
  end

  describe '#find' do
    it'returns a peep' do
      peep_repository = PeepRepository.new
      peep = peep_repository.find('1')
      expect(peep.content).to eq 'Jar Jar Noises'
    end
  end
end