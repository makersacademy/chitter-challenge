require 'pg'

describe '.all' do
  it 'returns a list of peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep)VALUES('hello world!');")
    peeps = Peep.all
    expect(peeps.last.peep).to eq "hello world!"
  end
end

describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create('i am the peep_spec test')
    expect(peep).to be_a Peep
    expect(peep.peep).to eq "i am the peep_spec test"
  end
end

describe '.register' do
  it 'stores a registered user' do
  end
end
