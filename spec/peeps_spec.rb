require 'peeps'

describe '.all' do
let(:connection)  { PG.connect(dbname: 'chitter_test') }
let(:peeps)   { Peeps.all }

  it 'Returns a list of Peeps' do
    connection.exec("INSERT INTO peeps (peeps, datenow) VALUES ('Can you believe its meant to rain for a whole week!', '2019-06-07 13:00:50');")
    connection.exec("INSERT INTO peeps (peeps, datenow) VALUES ('#typicalbritishweather', '2019-06-06 12:22:18');")
    expect(peeps[1].date).to eq "2019-06-07 13:00:50"
    expect(peeps[0].peeps).to eq "#typicalbritishweather"
  end
end

describe '.create' do
let(:connection)  { PG.connect(dbname: 'chitter_test') }
let(:peeps)   { Peeps.all }

  it 'Creates a new Peep' do
    Peeps.create('Can you believe its meant to rain for a whole week!', '2019-06-07 13:00:50')
    Peeps.create('#typicalbritishweather', '2019-06-06 12:22:18')
    expect(peeps[0].peeps).to eq "#typicalbritishweather"
    expect(peeps[1].date).to eq "2019-06-07 13:00:50"
  end
end
