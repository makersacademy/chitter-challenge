require 'peeps'

describe '.all' do
let(:connection)  { PG.connect(dbname: 'chitter_test') }
let(:peeps)   { Peeps.all }

  it 'Returns a list of Peeps' do
    connection.exec("INSERT INTO peeps (peeps) VALUES ('Nearly half way through Makers');")
    connection.exec("INSERT INTO peeps (peeps) VALUES ('Can you believe its meant to rain for a whole week!');")
    connection.exec("INSERT INTO peeps (peeps) VALUES ('#typicalbritishweather');")
    expect(peeps[0].peeps).to eq "Nearly half way through Makers"
    expect(peeps[1].peeps).to eq "Can you believe its meant to rain for a whole week!"
    expect(peeps[2].peeps).to eq "#typicalbritishweather"
  end
end

describe '.create' do
let(:connection)  { PG.connect(dbname: 'chitter_test') }
let(:peeps)   { Peeps.all }

  it 'Creates a new Peep' do
    Peeps.create('Nearly half way through Makers')
    Peeps.create('Can you believe its meant to rain for a whole week!')
    Peeps.create('#typicalbritishweather')
    expect(peeps[0].peeps).to include "Nearly half way through Makers"
    expect(peeps[1].peeps).to include "Can you believe its meant to rain for a whole week!"
    expect(peeps[2].peeps).to include "#typicalbritishweather"
  end
end
