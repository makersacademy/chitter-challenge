require 'peeps'

describe '.all' do
let(:connection)  { PG.connect(dbname: 'chitter') }
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

# describe '.create' do
#   it 'Creates a new Peep' do
#     Peeps.create(peep: 'Nearly half way through Makers')
#     peeps = Peeps.all
#     expect(peeps[0].peeps).to include "Nearly half way through Makers"
#     expect(peeps).to include "Can you believe it's meant to rain for a whole week!"
#     expect(peeps).to include "#typicalbritishweather"
#   end
# end

# INSERT INTO peeps(peeps_id, user_id, peeps, date) VALUES(3, 3, '#typicalbritishweather', '2019/06/01');
# SELECT * FROM peeps;
