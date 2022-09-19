require 'peep_repository'

describe PeepRepository do
  # Resetting the tables
  before(:each) do
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end

  it "returns a list of peeps ordered by the date and time posted (latest first)" do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps[0].id).to eq '4'
    expect(peeps[0].content).to eq 'I am currently working on my solo project.'
    expect(peeps[0].time_posted).to eq '2022-09-15 11:03:56'
    expect(peeps[0].username).to eq 'Phil'

    expect(peeps[1].id).to eq '3'
    expect(peeps[1].content).to eq 'I have just started designing the chitter challenge.'
    expect(peeps[1].time_posted).to eq '2022-09-15 09:31:40'
    expect(peeps[1].username).to eq 'Jonas'

    expect(peeps[2].id).to eq '2'
    expect(peeps[2].content).to eq 'Pairing was really fun today.'
    expect(peeps[2].time_posted).to eq '2022-09-13 14:54:45'
    expect(peeps[2].username).to eq 'Anna'

    expect(peeps[3].id).to eq '5'
    expect(peeps[3].content).to eq 'What a grey day!'
    expect(peeps[3].time_posted).to eq '2022-09-12 16:17:00'
    expect(peeps[3].username).to eq 'Jonas'

    expect(peeps[4].id).to eq '1'
    expect(peeps[4].content).to eq 'Learning about web apps is so exciting!'
    expect(peeps[4].time_posted).to eq '2022-09-10 14:15:00'
    expect(peeps[4].username).to eq 'Jonas'
  end

  it "create method creates a new peep, then all method displays it as first item (latest)" do
    repo = PeepRepository.new
    peep = Peep.new
    peep.content = "Who wants to meet up for a drink tonight?"
    peep.time_posted = '2022-09-15 16:25:07'
    peep.user_id = 3
    repo.create(peep)

    peeps = repo.all
    expect(peeps[0].id).to eq '6'
    expect(peeps[0].content).to eq 'Who wants to meet up for a drink tonight?'
    expect(peeps[0].time_posted).to eq '2022-09-15 16:25:07'
    expect(peeps[0].username).to eq 'Phil'
  end
end