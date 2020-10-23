require 'model.rb'

describe '.all' do
  it 'returns peeps on the table' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO chitter_peeps (peeps) VALUES ('My second try peep');")

    peeps = Peep.all
    expect(peeps).to include 'My second try peep'
    # expect(peeps).to include "My first second try peep"
  end
end