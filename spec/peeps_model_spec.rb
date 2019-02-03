require 'peeps'

connection = PG.connect(dbname: ENV['DATABASE'])

describe '.all' do
  it 'returns all peeps in database' do
    peeps = Peeps.all
    expect(peeps).to include('This is my first peep')
  end
end
