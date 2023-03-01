require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('schema/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  describe '#all' do
    it 'finds first peep' do
      peeps = repo.all('')

      expect(peeps.length).to eq 10 

      expect(peeps.first.id).to eq 1
      expect(peeps.first.content).to eq 'First peep babeh!'
      expect(peeps.first.time).to eq '2009-01-17 12:23:00'
      expect(peeps.first.user_id).to eq 'elonmusk'
    end

    it 'checks multiple records exist' do
      peeps = repo.all('')

      expect(peeps.length).to eq 10

      expect(peeps[4].id).to eq 5
      expect(peeps[4].content).to eq '@tesco, I want a refund #nowplease'
      expect(peeps[4].time).to eq '2022-10-06 14:01:00'
      expect(peeps[4].user_id).to eq 'canispeaktothemanager'
    end

    context 'checks reverse chronological order' do
      it 'returns the 4th most recent peep' do
        peeps = repo.all(' ORDER BY time DESC')
        
        expect(peeps.length).to eq 10 
        
        expect(peeps[3].id).to eq 3
        expect(peeps[3].content).to eq 'Watch our new series on #hulu'
        expect(peeps[3].time).to eq '2022-10-06 14:00:00'
        expect(peeps[3].user_id).to eq 'kyliejenner'
      end
    end
  end

  describe '#create' do
    it 'creates a new peep record' do
      peep = Peep.new
      peep.content = 'Testing 123'
      peep.time = (Time.now).strftime("%F %T")
      peep.user_id = 1

      repo.create(peep)

      all_peeps = repo.all('')
      last_peep = all_peeps.last
      expect(last_peep.content).to eq 'Testing 123'
      expect(last_peep.time).to eq (Time.now).strftime("%F %T")
      expect(last_peep.user_id).to eq 'bennyboy'
    end
  end


  describe '#find' do
    it 'finds a single peep' do
      peep = repo.find(2)
    
      expect(peep.id).to eq(2)
      expect(peep.content).to eq('Just started at makers')
      expect(peep.time).to eq('2022-09-12 09:15:00')
    end
  end

  private

  def repo
    repo = PeepRepository.new
  end
end