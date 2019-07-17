describe '.all' do
  it 'returns a list of all peeps' do
    connection = PG.connect(dbname: 'chitter_peeps_test')
    connection.exec("INSERT INTO peeps (peep) VALUES ('Today is Wednesday ');")
    peeps = Peeps.all

    expect(peeps).to include "Today is Wednesday "
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peeps.create(peep: 'Test peep')

    expect(Peeps.all).to include 'Test peep'
  end
end
