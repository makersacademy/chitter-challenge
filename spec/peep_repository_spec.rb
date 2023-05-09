require 'peep_repository'

def reset_chitter_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_chitter_tables
  end

  it 'gets all peeps' do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq  4

    expect(peeps[0].id).to eq  1
    expect(peeps[0].content).to eq  'This is the first Peep'
    expect(peeps[0].time).to eq  '2023-05-06 10:22:09'
    expect(peeps[0].user_id).to eq 1

    expect(peeps[1].id).to eq  2
    expect(peeps[1].content).to eq  'This is the second Peep'
    expect(peeps[1].time).to eq  '2023-05-07 15:35:35'
    expect(peeps[1].user_id).to eq 1

    expect(peeps[2].id).to eq  3
    expect(peeps[2].content).to eq  'This is the third Peep'
    expect(peeps[2].time).to eq  '2023-05-08 09:42:01'
    expect(peeps[2].user_id).to eq 2

    expect(peeps[3].id).to eq  4
    expect(peeps[3].content).to eq  'This is the forth Peep'
    expect(peeps[3].time).to eq  '2023-05-09 23:12:59'
    expect(peeps[3].user_id).to eq 2

  end

  it 'creates a new peep' do
    peep = Peep.new
    peep.content = 'This is the fifth Peep'
    peep.time =  '20230422 08:22:46 PM'
    peep.user_id = 2

    repo = PeepRepository.new

    repo.create(peep)

    last_peep = repo.all.last

    expect(last_peep.id).to eq  5
    expect(last_peep.content).to eq  'This is the fifth Peep'
    expect(last_peep.time).to eq  '2023-04-22 20:22:46'
    expect(last_peep.user_id).to eq 2
  end

  it 'finds all peeps made by the same user' do
    repo = PeepRepository.new

    peeps = repo.find_by_owner(1)

    expect(peeps.length).to eq  2

    expect(peeps[0].id).to eq  1
    expect(peeps[0].content).to eq  'This is the first Peep'
    expect(peeps[0].time).to eq  '2023-05-06 10:22:09'
    expect(peeps[0].user_id).to eq 1

    expect(peeps[1].id).to eq  2
    expect(peeps[1].content).to eq  'This is the second Peep'
    expect(peeps[1].time).to eq  '2023-05-07 15:35:35'
    expect(peeps[1].user_id).to eq 1
  end

  it 'finds all peeps that a given user has been tagged in' do
    repo = PeepRepository.new

    peeps = repo.find_by_tagged_user(1)

    expect(peeps.length).to eq  0

    peeps = repo.find_by_tagged_user(2)

    expect(peeps.length).to eq  2

    expect(peeps[0].id).to eq  1
    expect(peeps[0].content).to eq  'This is the first Peep'
    expect(peeps[0].time).to eq  '2023-05-06 10:22:09'
    expect(peeps[0].user_id).to eq 1

    expect(peeps[1].id).to eq  2
    expect(peeps[1].content).to eq  'This is the second Peep'
    expect(peeps[1].time).to eq  '2023-05-07 15:35:35'
    expect(peeps[1].user_id).to eq 1
  end


end