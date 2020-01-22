require 'chitterbase'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitterbase_test')

    peeps = Peeps.create(peep: 'I love Makers')

    peeps = Peeps.all

    expect(peeps.first.peep).to include "I love Makers"
    expect(peeps.first.id).to eq peeps.first.id
    expect(peeps.first).to be_a Peeps
  end
end

describe '.create' do
  it 'creates a new peep' do
    connection = PG.connect(dbname: 'chitterbase_test')

    Peeps.create(peep: 'I love Makers')

      peeps = Peeps.all


    expect(peeps.length).to eq 1
  end
end
