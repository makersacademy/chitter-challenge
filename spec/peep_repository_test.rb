require 'peep_repository.rb'
require 'peep.rb'

def reset_peeps_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'peeps_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  let(:repo) {PeepRepository.new}
  let(:new_peep) {Peep.new}

  describe '#all' do
    it 'returns all peeps in reverse chronological order' do
      peeps = repo.all
      expect(peeps[0].peep).to eq 'Test peep 1'
      expect(peeps[1].peep).to eq 'Test peep 2'
    end
  end

  describe '#create' do
  it 'creates and stores a new peep' do
    new_peep.peep = 'Test peep 1'
    new_peep.timestamp = '2023-04-10 12:34:56'
    new_peep.username_id = '1'
    repo.create(new_peep)

    peeps = repo.all
    expect(peeps.last.peep).to eq 'Test peep 1'
    expect(peeps.last.timestamp).to eq '2023-04-10 12:34:56'
    expect(peeps.last.username_id).to eq '1'
  end
end
end