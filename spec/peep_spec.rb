require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'Chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 1');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 2');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 3');")

    peeps = Peeps.all

    expect(peeps[0].peep).to include "Test peep 1"
    expect(peeps[1].peep).to include "Test peep 2"
    expect(peeps[2].peep).to include "Test peep 3"
  end
end
