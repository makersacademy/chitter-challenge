require 'peep'
require 'peep_repo'

def reset_peeps_table
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  
  describe PeepRepository do
    before(:each) do 
      reset_peeps_table
    end

  it 'Lists all objects in peeps array' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq 2
    expect(peeps.first.content).to eq 'just ate some chips'
    expect(peeps.first.date_time).to eq '2022-10-07 16:36:08.615435 +010'
    expect(peeps.first.user_id).to eq "1"
    expect(peeps.last.content).to eq 'anniversary day'
    expect(peeps.last.date_time).to eq '2022-10-07 16:37:20.82639 +0100 '
    expect(peeps.last.user_id).to eq "2"
  end

  it 'Creates a new peep' do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = "Had breakfast"  
    peep.date_time = '2022-10-08 11:48:24.390496 +0100 '
    peep.user_id = 2

    repo.create(peep)

    peeps = repo.all
    expect(peeps.length).to eq 3
    expect(peeps.last.content).to eq "Had breakfast"  
    expect(peeps.last.date_time).to eq '2022-10-08 11:48:24.390496 +0100 '
    expect(peeps.last.user_id).to eq "2"
  end

end





    